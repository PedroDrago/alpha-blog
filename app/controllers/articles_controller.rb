class ArticlesController < ApplicationController

  def show
    get_article

  end

  def index
    @articles = Article.all

  end

  def new
    @article = Article.new

  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was created successfully'
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    get_article
    if @article.update(article_params)
      flash[:notice] = 'Article was update successfully'
      redirect_to @article
    else
      render 'edit'
    end

  end

  def edit
    get_article

  end

  




  private
  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
