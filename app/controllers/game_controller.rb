class GameController < ApplicationController
  def start
    @game = Game.new
    @game.username = "Anonymous"

    @challenge = Challenge.first
  end
  
  def answer
    @challenge ||= Challenge.first
    if @challenge.valid_answer? params[:console][:code]
      redirect_to :action =>:next_level
    else
      flash[:message] = "Come on! Type 'start' and I'll give you some challenges!"
      redirect_to :action => :start
    end
  end
  def start_typing
    puts "start tying at #{Time.now}"
    render :json => {:sucess => true}.to_json
  end

  def next_level
    if not @challenge
      @challenge = Challenge.first
    end
    render :level => 1
  end

  def finish
  end

  def scores
  end
end
