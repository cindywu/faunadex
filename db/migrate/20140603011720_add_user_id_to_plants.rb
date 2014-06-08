class AddUserIdToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :user_id, :integer
    add_index :plants, :user_id
  end
end
