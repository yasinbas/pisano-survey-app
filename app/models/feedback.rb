class Feedback < ApplicationRecord
  belongs_to :survey
  
  validates :content, presence: true
  # Add any other feedback-specific validations you need
end  belongs_to :question
  validates :question_id, presence: true



  feedbacks_attributes: [
    :id,
    :content,
    :question_id,
    :_destroy
  ] 
  
  
  def new


    @survey = Survey.new
    @survey.questions.build
  end
end
      