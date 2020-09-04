class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    flash.notice = "Article created."
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params)
    flash.notice = "Article updated."
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    flash.notice = "Article deleted."
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])  
  end
end

