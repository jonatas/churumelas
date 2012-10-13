class AddCompilingFieldsToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :last_compiling_error, :text
    add_column :challenges, :last_compiling_error_trace, :text
    add_column :challenges, :tries_before_sucess, :integer, :default => 0
  end
end
