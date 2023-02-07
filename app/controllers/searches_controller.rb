class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]
  # if文を使い、検索モデルUserorBookで条件分岐
    if @range == "User"
   # looksメソッドを使い、検索内容を取得し、変数に代入。検索方法params[:search]と、検索ワードparams[:word]を参照してデータを検索し、
   # インスタンス変数@usersにUserモデル内での検索結果を代入
      @users = User.looks(params[:search], params[:word])
    else
  # インスタンス変数@booksにBookモデル内での検索結果を代入
      @books = Book.looks(params[:search], params[:word])
    end
  end
end