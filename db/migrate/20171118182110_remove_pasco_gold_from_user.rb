class RemovePascoGoldFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pasco_gold, :integer
  end
end
