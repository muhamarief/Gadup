class Income < ApplicationRecord
  belongs_to :wallet

  validates :category, presence: true

  enum category: [" ", 'Grants & Debt', 'Sale', 'Rent & Service', 'Gift', 'Investment', "Others"]
end
