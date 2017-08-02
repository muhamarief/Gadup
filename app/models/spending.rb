class Spending < ApplicationRecord
  belongs_to :wallet

  validates :category, presence: true
  enum category: [" ", 'Life & Entertainment', 'Sports', 'Food & Drinks', 'Transportation', 'Utilities', 'Communication', 'Electronics', 'Shopping', "Others"]

end
