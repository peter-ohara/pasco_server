class AddUserToGoldPurchase < ActiveRecord::Migration[5.1]
  def change
    add_reference :gold_purchases, :user, foreign_key: true
  end
end
