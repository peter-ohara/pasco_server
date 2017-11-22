class RemoveTransactionFlowFromGoldPurchase < ActiveRecord::Migration[5.1]
  def change
    remove_column :gold_purchases, :transaction_flow, :string
  end
end
