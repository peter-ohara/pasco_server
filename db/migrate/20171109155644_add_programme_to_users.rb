class AddProgrammeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :programme, :string
  end
end
