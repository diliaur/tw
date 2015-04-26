class AddContentToUtag < ActiveRecord::Migration
  def change
    add_column :utags, :content, :string
  end
end
