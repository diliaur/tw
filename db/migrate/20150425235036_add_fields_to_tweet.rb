class AddFieldsToTweet < ActiveRecord::Migration
  def change
  	add_column :tweets, :in_reply_to_screen_name, :string
  	add_column :tweets, :favorite_count, :integer
  	add_column :tweets, :is_reply, :boolean
  end
end
