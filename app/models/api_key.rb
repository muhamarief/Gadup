class ApiKey < ApplicationRecord
  before_create :generate_access_token!

  belongs_to :owner, polymorphic: true

  validates :access_token, uniqueness: true
  validates :owner, presence: true

  private
    def generate_access_token!
      begin
        self.access_token = SecureRandom.hex
      end while self.class.exists?(access_token: access_token)
    end

end
