class Income < ApplicationRecord
  belongs_to :wallet

  validates :category, null: false

  enum category: [" ", 'Grants & Debt', 'Sale', 'Rent & Service', 'Gift', 'Investment', "Others"]
end
