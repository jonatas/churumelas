class RemoveGameChallengeReferencesAndUseLevel < ActiveRecord::Migration
  def up
    add_column :game_challenges, :level, :integer
    remove_column :game_challenges, :challenge_id
  end
end
