class WelcomeController < ApplicationController

  before_action :login_required

  def current_user
    @user = session[:user_id]
  end

  def home
    current_user
  end

  private
  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
