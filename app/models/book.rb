class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  # book.book_commentsが使える
  validates :title,presence:true
  validates :body, presence:true, length:{maximum:200}
end
