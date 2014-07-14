class Book < ActiveRecord::Base

  validates :title, presence: true
  validates :normalized_title, uniqueness: { scope: :author_id }

  before_validation :update_normalized_title

  def update_normalized_title
    self.normalized_title = Normalizer.normalize_book_title(title) if title.present?
  end 

end
