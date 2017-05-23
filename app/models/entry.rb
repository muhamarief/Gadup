class Entry < ApplicationRecord

  validates :entries_url, :title, :feed_id, presence: true
  validates :entries_url, :image_url, uniqueness: true

  belongs_to :feed
end
