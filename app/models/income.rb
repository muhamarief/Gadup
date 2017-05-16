class Income < ApplicationRecord
  belongs_to :wallet

  monetize :nominal_cents, with_model_currency: :currency

  def all_currencies(hash)
    hash.keys
  end
end
