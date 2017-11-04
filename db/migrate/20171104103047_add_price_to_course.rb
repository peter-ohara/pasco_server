class AddPriceToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :price, :integer
  end
end
