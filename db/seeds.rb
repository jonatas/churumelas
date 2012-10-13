# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   http://churumelas.r12.railsrumble.com/
@start = Challenge.new
@start.title = "@you.can_start? # => return true"
@start.description = %q{Show me the world! Type "start" to face your first challenge!}
 @start.code_challenge = %q{if @challenge.valid_answer? params[:console][:code]
  redirect_to :action =>:next_level
else
  flash[:message] = "Come on! Type 'start' and I'll give you some challenges!"
  redirect_to :action => :start
end}
@start.code_help = %q{Imagine you are coding a system like me and want to be redirected to the first level you will need to pass the correct word.}
@start.correct_answer = "start"
@start.tags = "ruby beginner"
@start.image_url = "start.png"
@start.background_image_url = "start-background.png"
@start.save

