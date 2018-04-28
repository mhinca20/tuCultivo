class CreateLots < ActiveRecord::Migration[5.1]
  def change
    create_table :lots do |t|
      t.string :name
      t.string :location
      t.references :farm, foreign_key: true

      t.timestamps
    end
  end
end
