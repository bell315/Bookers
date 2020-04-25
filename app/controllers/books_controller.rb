class BooksController < ApplicationController

  def index
  	  @book = Book.new
  	  @books = Book.all
  end

  def create
  	  @book = Book.new(book_params)
      if @book.save
         flash[:notice] = "Book was successfully created."
  	    redirect_to book_path(@book.id)
      else
      #空白の場合
      @books = Book.all
      render "index"
      end
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def show
  	  @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = "Book was successfully created."
         redirect_to book_path(@book.id)
      else
         render 'edit'
      end

  end

  def destroy
  	  book = Book.find(params[:id]) #データ(レコード)を1件取得
      book.destroy #データ（レコード）を削除
      redirect_to books_path#List一覧画面へリダイレクト
  end

  private
  def book_params
  	  params.require(:book).permit(:title, :body)
  end
end
