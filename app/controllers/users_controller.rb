# frozen_string_literal: true

class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    # @user = User.new(user_params)

    if @user.save
      redirect_to new_users_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
