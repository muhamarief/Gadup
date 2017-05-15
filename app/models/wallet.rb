class Wallet < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :incomes
  has_many :spendings

  validates :owner, presence: true
  validates :owner_id, uniqueness: true
end
