class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.text :code_challenge
      t.text :code_help
      t.text :correct_answer
      t.string :tags
      t.string :image_url
      t.string :background_image_url

      t.timestamps
    end
  end
end
