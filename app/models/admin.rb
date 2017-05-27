class Admin < ApplicationRecord
  has_secure_password

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :registerable, :recoverable,
          :rememberable, :trackable, :validatable

  validates :name, presence: true, uniqueness: true


end
