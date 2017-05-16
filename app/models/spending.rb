class Spending < ApplicationRecord
  belongs_to :wallet

  monetize :nominal_cents, with_model_currency: :currency
end
