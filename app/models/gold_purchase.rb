class GoldPurchase < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :gold_ledger_entry, optional: true
  belongs_to :user

  monetize :price_pesewas, as: 'price'

  def self.calculate_amount(price)
    case price.to_s
    when '1.9'
      25
    when '4.9'
      80
    when '9.9'
      190
    when '19.9'
      500
    when '49.9'
      2500
    end
  end

  def name
    if gold_ledger_entry
    "GHS #{price} approved #{time_ago_in_words gold_ledger_entry.created_at} ago"
    else
      "GHS #{price} attempted #{time_ago_in_words created_at} ago"
    end
  end
end
