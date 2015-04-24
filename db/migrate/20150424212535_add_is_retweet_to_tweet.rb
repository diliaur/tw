class AddIsRetweetToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :is_retweet, :boolean
  end
end
