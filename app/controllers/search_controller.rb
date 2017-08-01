class SearchController < ApplicationController
  layout 'user', only: :index

  def index
    @wallet = current_authenticatee.wallets.first

    @balance = 0.to_d
    @wallet.spendings.all.each do |spending|
      @balance -= spending.nominal
    end
    @wallet.incomes.all.each do |income|
      @balance += income.nominal
    end

    @spending_shows = Spending.all.order(spending_time: :desc).limit(5)
    @income_shows = Income.all.order(transaction_time: :desc).limit(5)

    @q = params[:q]
    @v = params[:v]

    @spendings = @wallet.spendings.search(spending_time_gteq: @q, spending_time_lteq: @v).result
    @total_spending = 0.to_d
    @spendings.each do |spending|
      @total_spending += spending.nominal
    end

    @incomes = @wallet.incomes.search(transaction_time_gteq: @q, transaction_time_lteq: @v).result
    @total_income = 0.to_d
    @incomes.each do |income|
      @total_income += income.nominal
    end

    render template: "users/show"
  end

end
