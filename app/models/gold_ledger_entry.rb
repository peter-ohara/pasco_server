class GoldLedgerEntry < ApplicationRecord
  belongs_to :user, inverse_of: :gold_ledger_entries

  def name
    return "GoldLedgerEntry ##{id}" unless amount && user
    if amount >= 0
      "+#{amount}PG [#{user.email}]"
    else
      "#{amount}PG [#{user.email}]"
    end
  end
end
