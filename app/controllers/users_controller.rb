class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email],
                    password: params[:user][:password],
                    password_confirmation: params[:user][:password_confirmation])

    if @user && @user.save
      flash[:message] = ["user creation successful"]
      redirect_to root_path
    else
      flash[:message] = @user.errors.full_messages
      render :new
    end
  end
end
