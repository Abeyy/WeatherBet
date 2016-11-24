class CreatePredictions < ActiveRecord::Migration[5.0]
  def change
    create_table :predictions do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
