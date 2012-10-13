class GameController < ApplicationController
  before_filter :load_game_challenge, :only => [:start, :answer, :start_typing]
  def start
    if not @challenge
      flash[:message] = "Looks like you're awesome!"
      render 'finish'
    end
  end
  def answer
    if @game_challenge.pass_with! params[:console][:code]
      redirect_to :action => :start
    else
      flash[:message] = "Come on! Type 'start' and I'll give you some challenges!"
      render 'start'
    end
  end
  def start_typing
    puts "start tying at #{Time.now}"
    @game_challenge.start_typing = Time.now
    render :json => {:sucess => @game_challenge.save }.to_json
  end

  def finish
  end

  def scores
  end

  protected
  def load_game_challenge
    if params[:game_challenge_id]
      @game_challenge  = GameChallenge.find params[:game_challenge_id]
    else
      @game = Game.new
      @game_challenge = @game.start!
    end
    if @game_challenge
      @challenge = @game_challenge.challenge
    end
  end
end
