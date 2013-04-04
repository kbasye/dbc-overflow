class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new

  end

  def create
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :action => 'index'
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
