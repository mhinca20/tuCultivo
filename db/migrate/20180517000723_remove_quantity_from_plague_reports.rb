class RemoveQuantityFromPlagueReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :plague_reports, :quantity, :int
  end
end
