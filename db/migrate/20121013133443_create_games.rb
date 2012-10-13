class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :username

      t.timestamps
    end
  end
end
