class UpdateTweetModel < ActiveRecord::Migration
  def change
  	add_column :tweets, :tweet_id, :integer
  	add_column :tweets, :tweet_created_at, :datetime
  	add_column :tweets, :location, :string
  end
end
