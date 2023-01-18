class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 12)

  end

  def show
    set_user
 
  end

  

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username} You have successfully signed up!"
      redirect_to articles_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User credentials updated successfully'
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to articles_path
    
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end
end