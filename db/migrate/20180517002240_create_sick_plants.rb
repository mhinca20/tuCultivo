class CreateSickPlants < ActiveRecord::Migration[5.1]
  def change
    create_table :sick_plants do |t|
      t.integer :location
      t.references :plague_report, foreign_key: true

      t.timestamps
    end
  end
end
