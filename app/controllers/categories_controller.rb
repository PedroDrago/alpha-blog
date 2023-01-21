class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update]

  def new
    @category = Category.new

  end

  def create
    @category = Category.new(get_params)
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to @category
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def show


  end



  def index
    @categories = Category.all

  end

  def edit


  end

  def update
    if @category.update(get_params)
      flash[:notice] = 'Category was update successfully'
      redirect_to @category
    else
      render 'edit', status: :unprocessable_entity
    end
    
    
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def get_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = 'Only admins can perform that action'
      redirect_to categories_path
    end

  end
end
