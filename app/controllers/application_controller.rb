class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
helper_method :user_signed_in?, :current_user #makes it available in all the views

  def user_signed_in?
    !!current_user #false of false = true
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] #returns true or false
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to root_path, alert: "You must be logged in to do that"
    end
  end
end
