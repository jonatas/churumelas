class GameController < ApplicationController
  before_filter :load_game_challenge, :only => [:start, :level, :answer, :start_typing]
  def start
    redirect_to "/game/level/#{@game.current_level}"
  end
  def level
    render 'start'
  end
  def answer
    puts "Answering question on level #{@game_challenge.level}: #{@game_challenge.challenge.title}"
    if @game_challenge.pass_with!(params[:console][:code])
      puts "You pass! #{@game_challenge.last_answer}"
      if @game_challenge.level == 6
        @game.username = @game_challenge.instance_variable_get "@username"
        @game.save
      end
      if @game.current_level == Challenges.last.level
         @game = @game_challenge.game
        flash[:message] = "Congratulations! You finish!"
        render 'finish'
      else
        flash[:message] = "Congratulations! You pass level #{@game.current_level}!"
        @game_challenge = @game.get_level!(@game.current_level + 1)
        @challenge = @game.current_challenge
        redirect_to "/game/level/#{@game.current_level}"
      end
    else
      flash[:error] = @game_challenge.last_compiling_error
      render 'start'
    end
  end
  def see_valid_answer
    render :json => {:valid_answer => Challenges.get_level(params[:current_level].to_i).valid_answer}
  end
  def start_typing
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
  def about_us
    render "_about_us"
  end
  protected
  def load_game_challenge
    if not session[:game_id]
      @game = Game.new
      @game.username = "not defined"
      @game.save
      session[:game_id] = @game.id
      params[:current_level] = 1
    else
      @game = Game.find session[:game_id]
      params[:current_level] = @game.current_level
    end
    @game_challenge = @game.get_level!(params[:current_level].to_i)
    @challenge = @game.current_challenge
  end
end
