class User < ActiveRecord::Base

  has_many :user_books
  has_many :books, through: :user_books

  def add_book(book)
    user_book = UserBook.create(user: self, book: book)
    user_book.persisted? user_book.value : false
  end  

end
