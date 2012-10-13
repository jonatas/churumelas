class CreateGameChallenges < ActiveRecord::Migration
  def change
    create_table :game_challenges do |t|
      t.references :game
      t.references :challenge
      t.datetime :started_at
      t.datetime :start_typing_at
      t.datetime :submit_first_time_at
      t.datetime :pass_level_at
      t.text :user_answer

      t.timestamps
    end
    add_index :game_challenges, :game_id
    add_index :game_challenges, :challenge_id
  end
end
