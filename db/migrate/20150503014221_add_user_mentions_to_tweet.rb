class AddUserMentionsToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :user_mentions, :string
  end
end
