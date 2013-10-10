class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end
  helper_method :current_author
  
  def authorize
    redirect_to root_url, alert: "Not authorized" if current_author.nil?
  end
end
