class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login
  def require_login
    unless session[:id]
      redirect_to action: :index, controller: :welcome
    end
  end
end