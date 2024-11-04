class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  validates :title, presence: true
  
  enum status: {
    draft: 0,
    published: 1,
    closed: 2,
    archived: 3
  }

  scope :active, -> { where(status: :published) }
  scope :public_surveys, -> { where(is_public: true) }
  
  def can_be_edited?
    draft? || (published? && responses_count.zero?)
  end
end 