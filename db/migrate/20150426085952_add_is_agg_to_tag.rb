class AddIsAggToTag < ActiveRecord::Migration
  def change
    add_column :tags, :is_agg, :boolean
  end
end
