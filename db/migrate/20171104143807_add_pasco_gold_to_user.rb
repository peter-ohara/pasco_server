class AddPascoGoldToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pasco_gold, :integer
  end
end
