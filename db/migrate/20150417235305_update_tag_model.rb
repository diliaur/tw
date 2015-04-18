class UpdateTagModel < ActiveRecord::Migration
  def change
  	add_column :tags, :parent_tweet_id, :integer
  	add_column :tags, :parent_user_id, :integer
  	add_column :tags, :location, :string
  end
end
