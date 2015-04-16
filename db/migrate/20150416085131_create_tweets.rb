class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :content
      t.string :tags
      t.integer :user_id
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
