class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :text))

    if @article.save
      redirect_to @article
    else
      flash[:notice] = "Title cannot be blank."
      render 'new'
   end
 end

  def index; end

  private
  def article_params
   params.require(:article).permit(:title, :text)
  end
end