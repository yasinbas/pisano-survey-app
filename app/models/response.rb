class Response < ApplicationRecord
  belongs_to :survey
  belongs_to :user, optional: true
  
  validates :answers, presence: true
  validates :respondent_email, presence: true, if: -> { user.blank? }
  
  before_save :mark_as_completed
  after_save :update_survey_counter
  
  private
  
  def mark_as_completed
    self.completed_at ||= Time.current
  end
  
  def update_survey_counter
    survey.increment!(:responses_count)
  end
end
