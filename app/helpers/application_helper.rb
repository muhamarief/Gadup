module ApplicationHelper
  include ActionView::Helpers::NumberHelper

  def amount_to_rupiah(amount)
    number_to_currency(amount, :unit=>'IDR')
  end

end
