class SessionsController < ApplicationController

  def new
    
  end

  def create
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)    
    else
      flash[:error] = "Invalid email/password combination suckaaaaaaaaaa"
      render :action => 'index'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
