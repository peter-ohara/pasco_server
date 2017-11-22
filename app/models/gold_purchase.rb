class GoldPurchase < ApplicationRecord
  include ActionView::Helpers::DateHelper

  belongs_to :gold_ledger_entry, optional: true
  belongs_to :user

  enum network: {
      mtn: 0,
      vodafone: 1,
      airtel: 2,
      tigo: 3
  }

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

  rails_admin do
    list do
      field :user

      field :amount do
        formatted_value do # used in form views
          "#{value} PG"
        end

        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          "#{value} PG"
        end
      end

      field :price do
        formatted_value do # used in form views
          "GHS #{value}"
        end

        pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
          "GHS #{value}"
        end
      end
      field :network
      field :gold_ledger_entry
      field :created_at
      field :updated_at
    end
  end
end
