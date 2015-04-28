class AddPopScoreToUtag < ActiveRecord::Migration
  def change
    add_column :utags, :pop_score, :integer
  end
end
