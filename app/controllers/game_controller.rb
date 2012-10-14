class GameController < ApplicationController
  before_filter :load_game_challenge, :only => [:start, :answer, :start_typing]
  def start
    if not @challenge
      flash[:message] = "Looks like you're awesome!"
      render 'finish'
    end
  end
  def answer
    puts "Answering question on level #{@game_challenge.level}: #{@game_challenge.challenge.title}"
    if @game_challenge.pass_with!(params[:console][:code])
      puts "You pass! #{@game_challenge.last_answer}"
      if @game_challenge.level == Challenges.last.level
        flash[:message] = "Congratulations! I really wait you enjoy it! Thank you so much for spending your time looking for our idea :)"
        render 'finish'
      else
        @game= @game_challenge.game 
        flash[:message] = "Congratulations! You pass level #{@game.current_level}!"
        @game.next_challenge!
        @game_challenge = @game.current_game_challenge
        @challenge = @game_challenge.challenge
        render 'start'
      end
    else
      flash[:error] = @game_challenge.last_compiling_error
      render 'start'
    end
  end
  def start_typing
    puts "start tying at #{Time.now}"
    if not @game_challenge.start_typing_at 
      @game_challenge.start_typing_at = Time.now
      @game_challenge.save
    end
    render :json => {:sucess => true}.to_json
  end

  def finish
  end

  def scores
  end

  protected
  def load_game_challenge
    p params
    if params[:game_challenge_id].blank?
      puts "Starting a new game!!!"
      @game = Game.new
      @game.username = "not defined"
      @game.save
      @game_challenge = @game.start!
    else
      @game_challenge  = GameChallenge.find params[:game_challenge_id]
      puts "Game challenge found"
    end
    if @game_challenge
      @challenge = @game_challenge.challenge
    end
  end
end
