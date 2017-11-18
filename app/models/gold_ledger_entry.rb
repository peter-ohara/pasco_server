class GoldLedgerEntry < ApplicationRecord
  belongs_to :user, inverse_of: :gold_ledger_entries
end
