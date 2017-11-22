class GoldPurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :amount, :network
  has_one :gold_ledger_entry
end
