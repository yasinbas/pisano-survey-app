class WebhookService
  def self.trigger(event, payload)
    Webhook.active.where("events @> ?", [event].to_json).find_each do |webhook|
      WebhookDeliveryJob.perform_later(webhook.id, event, payload)
    end
  end
end 