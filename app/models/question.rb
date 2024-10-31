class Question < ApplicationRecord
  belongs_to :survey
  
  validates :content, presence: true
  validates :question_type, presence: true
  
  # Optional: Add enum for question types if you want to restrict to specific formats
  enum question_type: {
    multiple_choice: 0,
    text: 1,
    rating: 2,
    boolean: 3
  }
end
