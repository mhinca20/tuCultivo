class AddReferenceToNode < ActiveRecord::Migration[5.1]
  def change
    add_column :nodes, :reference, :string
  end
end
