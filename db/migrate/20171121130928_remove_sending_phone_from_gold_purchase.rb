class RemoveSendingPhoneFromGoldPurchase < ActiveRecord::Migration[5.1]
  def change
    remove_column :gold_purchases, :sending_phone, :string
  end
end
