class UsersController < ApplicationController
  def create
    # byebug
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id]= @user.id
      redirect_to '/login'
    else
      redirect_to '/users/new'
    end
  end

  def new
    @user = User.new
  end

  def welcome
  end
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
