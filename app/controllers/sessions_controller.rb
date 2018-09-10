require 'pry'

class SessionsController < ApplicationController
  has_secure_password

  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(name: user_params[:name])
      return head(:forbidden) unless  @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      redirect_to users_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end


end
