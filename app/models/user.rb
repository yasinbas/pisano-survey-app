class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]

  # Role enum'unu attribute olarak tanımla
  attribute :role, :integer, default: 0

  # Enum tanımlaması
  enum role: { user: 0, admin: 1 }

  has_many :surveys, dependent: :destroy
  has_many :activity_logs, dependent: :nullify

  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.avatar_url = auth.info.image
      user.role = :user
      user.active = true
    end
  end

  def active_for_authentication?
    super && active?
  end

  def inactive_message
    active? ? super : :inactive_account
  end

  def generate_jwt
    JwtService.encode({ user_id: id, email: email, role: role })
  end
end 