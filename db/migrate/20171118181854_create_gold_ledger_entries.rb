class CreateGoldLedgerEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :gold_ledger_entries do |t|
      t.references :user, foreign_key: true
      t.integer :amount
      t.text :notes

      t.timestamps
    end
  end
end
