class Wallet < ApplicationRecord
  belongs_to :owner, polymorphic: true
  has_many :incomes, dependent: :destroy
  has_many :spendings, dependent: :destroy
  has_one :wallet_setting, dependent: :destroy

  validates :owner, presence: true
  validates :owner_id, uniqueness: true

  def total_spendings_by_month(month)
    spendings = self.spendings.where('extract(month from spending_time) = ?', month)
    return spendings.inject(0){|sum, x| sum + x }
  end

  def total_incomes_by_month(month)
    incomes = self.incomes.where('extract(month from spending_time) = ?', month)
    return incomes.inject(0){|sum, x| sum + x }
  end
end
