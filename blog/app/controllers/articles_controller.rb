class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "bond", password: "007", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show  
    @article = Article.find(params[:id])
  end

  def new
    @books = Book.all
    @article = Article.new
  end

  def edit
    @books = Book.all
    @article = Article.find(params[:id])
  end

  def create
    @books = Book.all
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    respond_to do |format|
    if @article.update(article_params)
      format.html {redirect_to @article}
      format.json {head :no_content}
    else
      format.html {render 'edit'}
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
 
  private
  def article_params
    params.require(:article).permit(:title,:text, :image, :user_id, :book_ids => [])
  end
end