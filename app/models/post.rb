class Post < ActiveRecord::Base
  has_many :comments
  scope :ordered_by_ratings, -> { order(rating: :desc) }

  def vote!
    self.rating += 1
  end
end
