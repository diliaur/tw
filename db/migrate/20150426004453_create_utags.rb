class CreateUtags < ActiveRecord::Migration
  def change
    create_table :utags do |t|
      t.integer :count
      t.integer :rt_count
      t.integer :fav_count
      t.datetime :first_mention
      t.datetime :last_mention

      t.timestamps null: false
    end
  end
end
