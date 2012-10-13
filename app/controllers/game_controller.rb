class GameController < ApplicationController
  before_filter :load_game_challenge, :only => [:start, :answer, :start_typing]
  def start
    if not @challenge
      flash[:message] = "Looks like you're awesome!"
      render 'finish'
    end
  end
  def answer
    puts @game_challenge.challenge.title
    if @game_challenge.pass_with!(params[:console][:code])
      next_challenge = @game_challenge.game.next_challenge!
      puts next_challenge.challenge.title
      @game_challenge = next_challenge
      flash[:message] = "Congratulations!"
      @game_challenge = next_challenge
      render 'start'
    else
      if not flash[:error] = @game_challenge.last_compiling_error
        flash[:message] = "Come on! Type 'start' and I'll give you some challenges!"
      end
      render 'start'
    end
  end
  def start_typing
    puts "start tying at #{Time.now}"
    @game_challenge.start_typing = Time.now
    @game_challenge.save
    render :json => {:sucess => @game_challenge.save }.to_json
  end

  def finish
  end

  def scores
  end

  protected
  def load_game_challenge
    if params[:game_challenge_id].blank?
      @game = Game.new
      @game.username = "not defined"
      @game.save
      @game_challenge = @game.start!
    else
      @game_challenge  = GameChallenge.find params[:game_challenge_id]
    end
    if @game_challenge
      @challenge = @game_challenge.challenge
    end
  end
end
