class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many   :reviews
  accepts_nested_attributes_for :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def soldout?
    self.quantity == 0
  end

# Functions below are for determining if a product has any reviews, if so,
# calculate the average. Now can use these methods in the product/view/show page.

  def has_review?
    reviews.count > 0
  end

  def average_rating
    reviews.inject(0.0) {|review, next_review| review + next_review.rating } / reviews.count
  end

end
