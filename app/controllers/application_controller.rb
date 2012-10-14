class ApplicationController < ActionController::Base
  protect_from_forgery
  def about_us
    render "game/_about_us"
  end
end
