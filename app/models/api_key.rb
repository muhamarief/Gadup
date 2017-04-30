class ApiKey < ApplicationRecord
  before_create :generate_access_token!

  belongs_to :owner, polymorphic: true

  validates :access_token, presence: true
  validates :owner, presence: true

  def generate_access_token!
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exist?(access_token: access_token)
  end
end
