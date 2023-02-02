class BooksController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    # Book：クラス/.new：メソッド
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      # redirect_to book_path(@book)：showアクション(book_path(@book))の機能を実行する
      # render 'index'：indexのアクションを通さず/動かさずにindexのビューを表示させる
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
    # @newbook = Book.new：books/showを参照
    @user = @book.user
    # BookComment：モデル名(modelsに記述)
    @book_comment = BookComment.new
    @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    book = Book.find(params[:id])
    unless book.user == current_user
      redirect_to books_path
    end
  end
end
