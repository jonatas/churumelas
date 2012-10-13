class GameController < ApplicationController
  def start
  end
  
  def answer
    if params[:console][:code] == "start"
      redirect_to :action =>:next_level
    else
      flash[:message] = "Come on! Type 'start' and I'll give you some challenges!"
      redirect_to :action => :start
    end
  end

  def next_level
    if not session[:level]
      session[:level] = 1
    end
    render :level => 1
  end

  def finish
  end

  def scores
  end
end
