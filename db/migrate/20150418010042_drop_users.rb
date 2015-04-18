class DropUsers < ActiveRecord::Migration
  def up
  	drop_table :users
  end

  def down
  	create_table :users do |t|
  		t.integer :user_id
  		t.string  :screen_name
  		t.string  :location

  		t.timestamps null: false
  	end
  end
end
