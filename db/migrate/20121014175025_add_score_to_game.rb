class AddScoreToGame < ActiveRecord::Migration
  def change
    add_column :games, :score, :integer, :default => 0
    add_column :game_challenges, :score, :integer, :default => 0
  end
end
