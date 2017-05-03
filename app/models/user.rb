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

  private
  def generate_confirmation_token(length = 20)
    rlength = (length * 3) / 4
    token = SecureRandom.urlsafe_base64(rlength).tr('lIO0', 'sxyz')
    self.confirmation_token = token
  end
end
