class RemoveColsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :id, :integer
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
  end
end
