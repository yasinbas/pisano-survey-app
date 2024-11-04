class Question < ApplicationRecord
  belongs_to :survey
  
  validates :content, presence: true
  
  enum question_type: {
    text: 0,
    textarea: 1,
    single_choice: 2,
    multiple_choice: 3,
    rating: 4,
    date: 5
  }

  acts_as_list scope: :survey
end 