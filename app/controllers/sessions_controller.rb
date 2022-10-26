class SessionsController < ApplicationController
  def new
    @user = User.first

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      #session[:username] = user.username 
      flash[:notice] = 'Logged in successfully'
      redirect_to user

    else
      flash.now[:alert] = 'There was something wrong with your login details'
      render 'new'
      
    end
     

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to root_path

  end
end