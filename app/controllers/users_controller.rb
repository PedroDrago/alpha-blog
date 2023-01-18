class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index, :new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 12)
  end

  def show
 
  end

  def new
    @user = User.new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
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
      session[:user_id] = nil if @user == current_user
      flash[:notice] = 'Account and all associated articles successfully deleted'
      redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:warning]="You can only manipulate your own profile"
      redirect_to users_path
    else
    end
  end
  
end