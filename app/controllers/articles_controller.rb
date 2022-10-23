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
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article was created successfully'
      redirect_to @article
    else
      render 'new'
    end
  end


  




  private
  def get_article
    @article = Article.find(params[:id])
  end

end
