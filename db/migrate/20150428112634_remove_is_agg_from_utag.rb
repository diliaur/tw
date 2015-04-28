class RemoveIsAggFromUtag < ActiveRecord::Migration
  def change
    remove_column :utags, :is_agg, :boolean
  end
end
