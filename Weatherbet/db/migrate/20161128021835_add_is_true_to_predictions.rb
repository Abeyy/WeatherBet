class AddIsTrueToPredictions < ActiveRecord::Migration[5.0]
  def change
    add_column :predictions, :istrue, :boolean
  end
end
