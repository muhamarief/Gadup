class Feed < ApplicationRecord

  validates :name, :url, presence: true
  validates :url, uniqueness: true

  has_many :entries
end
