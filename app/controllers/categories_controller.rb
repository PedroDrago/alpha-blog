class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new

  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    if @category.save
      flash[:notice] = 'Category was successfully created'
      redirect_to @category
    else
      render 'new', status: :unprocessable_entity
    end
  end
  
  def show
    @category = Category.find(params[:id])

  end



  def index
    @categories = Category.all

  end

  def edit
    @category = Category.find(params[:id])


  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params.require(:category).permit(:name))
      flash[:notice] = 'Category was update successfully'
      redirect_to @category
    else
      render 'edit', status: :unprocessable_entity
    end
    
    
  end

  private
  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = 'Only admins can perform that action'
      redirect_to categories_path
    end

  end
end
