class AddUserToFarm < ActiveRecord::Migration[5.1]
  def change
    add_reference :farms, :user, foreign_key: true
  end
end
