class RemoveIsTrueFromPredictions < ActiveRecord::Migration[5.0]
  def change
    remove_column :predictions, :istrue, :boolean
  end
end
