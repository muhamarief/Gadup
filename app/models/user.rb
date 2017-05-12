class User < ApplicationRecord
  has_secure_password

  before_create :generate_confirmation_token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :registerable, :recoverable,
          :rememberable, :trackable, :validatable

  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :password, presence: true, on: :create

  has_many :api_keys, as: :owner

  def confirmation_expired?
    #3days duration
    duration = 3600 * 24 * 3
    true if self.confirmation_sent_at + duration < Time.now
  end

  def after_expired_confirmation_email
    regenerate_confirmation_token
  end

  def activate_account
    self.email_confirmed = true
    self.confirmation_token = nil
  end

  private
  def generate_confirmation_token
    token = SecureRandom.urlsafe_base64.to_s
    self.confirmation_token = token
    self.confirmation_sent_at = Time.now
  end

  def regenerate_confirmation_token
    self.generate_confirmation_token
    self.save
  end
end
