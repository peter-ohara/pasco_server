class GoldPurchaseSerializer < ActiveModel::Serializer
  attributes :id, :price, :amount
  has_one :gold_ledger_entry
end
