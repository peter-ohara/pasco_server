class ChangePriorityToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :questions, :priority, :float
  end
end
