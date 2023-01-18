class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all

  end

  def show

  end

  def new
    @article = Article.new

  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = User.first #hardcoded
    if @article.save
      flash[:notice] = 'Article was created successfully'
      redirect_to @article
    else
      render 'new', status: :unprocessable_entity
    end


  end

  def edit

  end

  def update
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was updated successfully'
      redirect_to @article
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was deleted successfully'
    redirect_to articles_path
    
  end


  private
  def set_article
    @article = Article.find(params[:id])

  end
end
