class AddReportToPredictions < ActiveRecord::Migration[5.0]
  def change
    add_reference :predictions, :report, foreign_key: true
  end
end
