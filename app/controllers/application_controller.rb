class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end
  helper_method :current_author
end
