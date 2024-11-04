class ActivityLog < ApplicationRecord
  belongs_to :user, optional: true

  scope :recent, -> { order(created_at: :desc) }
  scope :by_user, ->(user_id) { where(user_id: user_id) }
  scope :by_action, ->(action) { where(action: action) }
  
  def self.log(user, action, params = {})
    create(
      user: user,
      action: action,
      params: params,
      ip_address: params[:ip_address],
      user_agent: params[:user_agent],
      started_at: Time.current
    )
  end
end 