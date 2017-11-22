class AddAmountToGoldPurchase < ActiveRecord::Migration[5.1]
  def change
    add_column :gold_purchases, :amount, :integer
  end
end
