class AddLastAnswerToGameChallenges < ActiveRecord::Migration
  def change
    add_column :game_challenges, :last_answer, :text
  end
end
