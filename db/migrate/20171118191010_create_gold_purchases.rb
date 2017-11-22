class CreateGoldPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :gold_purchases do |t|
      t.references :gold_ledger_entry, foreign_key: true
      t.integer :price_pesewas
      t.string :price_currency, default: 'GHS', null: false
      t.string :sending_phone
      t.string :transaction_flow

      t.timestamps
    end
  end
end
