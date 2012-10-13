class GameController < ApplicationController
  def start
  end
  
  def answer
    if params[:console][:code] == "start"
      redirect_to :action =>:next_level
    else
      render :nothing => true
    end
  end

  def next_level
  end

  def finish
  end

  def scores
  end
end
