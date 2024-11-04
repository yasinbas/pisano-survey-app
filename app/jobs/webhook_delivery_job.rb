class WebhookDeliveryJob < ApplicationJob
  queue_as :webhooks
  retry_on StandardError, wait: :exponentially_longer, attempts: 3

  def perform(webhook_id, event, payload)
    webhook = Webhook.find(webhook_id)
    delivery = webhook.deliveries.create!(
      event: event,
      payload: payload,
      status: 'pending'
    )

    response = HTTP.headers(
      'Content-Type' => 'application/json',
      'X-Webhook-Signature' => generate_signature(payload, webhook.secret_token)
    ).post(webhook.url, json: payload)

    delivery.update!(
      response_code: response.code,
      response_body: response.body.to_s,
      delivered_at: Time.current,
      status: response.success? ? 'delivered' : 'failed'
    )
  rescue StandardError => e
    delivery.update!(
      status: 'failed',
      error_message: e.message
    )
    raise
  end

  private

  def generate_signature(payload, secret)
    OpenSSL::HMAC.hexdigest('SHA256', secret, payload.to_json)
  end
end 