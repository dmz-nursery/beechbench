class UserBook < ActiveRecord::Base
 
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true
  validates :book_id, uniqueness: { scope: :user_id }

  def value
    BookKeeper.compute_book_value(self)
  end  

end
