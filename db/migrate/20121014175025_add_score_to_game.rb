class AddScoreToGame < ActiveRecord::Migration
  def up 
    add_column :games, :score, :integer, :default => 0
    add_column :game_challenges, :score, :integer, :default => 0
  end
end
