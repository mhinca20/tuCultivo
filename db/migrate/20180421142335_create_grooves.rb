class CreateGrooves < ActiveRecord::Migration[5.1]
  def change
    create_table :grooves do |t|
      t.integer :quantity
      t.references :lot, foreign_key: true

      t.timestamps
    end
  end
end
