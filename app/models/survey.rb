class Survey < ApplicationRecord
  has_many :feedbacks, dependent: :destroy
  
  validates :title, presence: true
  # Add any other survey-specific validations you need
end
