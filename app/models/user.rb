class User < ApplicationRecord
  has_secure_password

  has_many :email_verification_tokens, dependent: :destroy
  has_many :password_reset_tokens, dependent: :destroy
  has_many :sessions, dependent: :destroy

  has_one :profile, dependent: :destroy

  has_many :posts, dependent: :destroy
  has_many :articles, dependent: :destroy

  # validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 10 }, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])/ }
  validates :role, presence: true

  enum role: { basic: 0, admin: 99 }

  before_validation if: -> { email.present? } do
    self.email = email.downcase.strip
  end

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).destroy_all
  end

  before_create -> { build_profile(name: "Siervo Fiel #{Time.current.to_i/Time.current.sec}") }

  def username
    return profile.name if profile.name.present?

    email
  end
end
