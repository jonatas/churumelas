class AddCurrentLevelToGame < ActiveRecord::Migration
  def change
    add_column :games, :current_level, :integer, :default => 1
  end
end
