class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :content
      t.datetime :parent_created_at

      t.timestamps null: false
    end
  end
end
