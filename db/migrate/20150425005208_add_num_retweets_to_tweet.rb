class AddNumRetweetsToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :num_retweets, :integer
  end
end
