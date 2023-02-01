class BookComment < ApplicationRecord
  belongs_to :user
  belongs_to :book
                    # presence: true：空ではい(空のデータを登録できないようにする)
  validates :comment, presence:true
end
