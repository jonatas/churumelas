class AddCompilingFieldsToChallenges < ActiveRecord::Migration
  def change
    add_column :game_challenges, :last_compiling_error, :text
    add_column :game_challenges, :last_compiling_error_trace, :text
    add_column :game_challenges, :tries_before_sucess, :integer, :default => 0
  end
end
