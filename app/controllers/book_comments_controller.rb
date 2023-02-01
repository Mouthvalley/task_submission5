class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
  # ？@book = Book.find(params[:id])

    comment = current_user.book_comments.new(book_comment_params) # 以下の記述と同じ意味
    # comment = BookComment.new(book_comment_params)
    # comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  # ？redirect_to book_path(@book)
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = Book.new
  end

  def destroy
    BookComment.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])
  end
  # book_controller参照
  # def destroy
  #   # book = Book.find(params[:id])
  #   # book.destroy
  #   # redirect_to books_path
  # end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
