class BooksController < ApplicationController
	def index
		@books=Book.all
	end
	def new 
		@articles = Article.all
		@book=Book.new
	end
	def create
		@article=Article.new
		@book=Book.new(book_params)
		if @book.save
			redirect_to @book
		else
			render 'new'
		end
	end	
    def edit
         @articles = Article.all
         @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
             redirect_to @book
        else
             render 'edit'
        end
    end
	def show
		@articles = Article.all
		@book=Book.find(params[:id])
	end
	def destroy
		@book=Book.find(params[:id])
		@book.destroy
        redirect_to books_path
    end

	private
	def book_params
		params.require(:book).permit(:title,:article_ids => [])
	end
end
