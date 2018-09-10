class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def homepage
    if session[:user]
      render '/users/welcome'
    else
      render 'users/new'
    end
  end
end
