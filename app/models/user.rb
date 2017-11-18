class User < ApplicationRecord
  has_secure_password

  has_many :purchases, inverse_of: :user
  has_many :courses, through: :purchases
  has_many :gold_ledger_entries, inverse_of: :user

  def pasco_gold
    gold_ledger_entries.sum(:amount)
  end
end
