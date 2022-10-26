class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end


  def new
    @user = User.new
    

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username}, You have successfully sign up"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

  end



  def update
    if @user.update(user_params)
      flash[:notice] = 'Your account information was successfully updated'
      redirect_to @user
    else
      render 'edit'
    end

  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)  
  end

  def set_user
    @user = User.find(params[:id])
    
  end


end
 
# "user"=>{"username"=>"drago", "email"=>"drago@email.com", "password"=>"dragosenha"},
# "commit"=>"Create User", "controller"=>"users", "action"=>"create"} permitted: false>