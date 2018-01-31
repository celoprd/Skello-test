class Post < ActiveRecord::Base
  has_many :comments
  validates :title,  presence: true
  validates :content,  presence: true
  scope :ordered_by_ratings, -> { order(rating: :desc) }
end
