class CreatePlagueReports < ActiveRecord::Migration[5.1]
  def change
    create_table :plague_reports do |t|
      t.integer :quantity
      t.date :reportDate
      t.text :description
      t.references :groove, foreign_key: true

      t.timestamps
    end
  end
end
