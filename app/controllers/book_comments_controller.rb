class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params) # 以下の記述と同じ意味
    # comment = BookComment.new(book_comment_params)
    # comment.user_id = current_user.id
    @comment.book_id = @book.id
    # create.js.erbで指定している為、book_controllerでも指定する必要がある。
    @book_comment = BookComment.new
    unless @comment.save
      render 'error'
    end
  end

  def destroy
    BookComment.find(params[:id]).destroy
    @book = Book.find(params[:book_id])
    # destroy.js.erbで指定している為、book_controllerでも指定する必要がある。
    @book_comment = BookComment.new
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
