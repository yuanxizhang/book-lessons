class Instructor < ApplicationRecord
  mount_uploader :picture, PictureUploader

  has_many :lessons, :dependent => :destroy
  has_many :skills, through: :lessons
  has_many :reviews, :dependent => :destroy
  has_many :users, through: :reviews

  validates :name, presence: true

  scope :by_rating, -> { 
      joins(:reviews) 
      .group("instructors.id") 
      .order("AVG(reviews.rating) DESC, COUNT(reviews.id) DESC")
    }

  accepts_nested_attributes_for :reviews

  def average_rating
      if self.reviews.size > 0
          self.reviews.average(:rating).round(1)
      else
          'No ratings'
      end
  end

  def review_count
    if self.reviews.count == 0
      "No reviews."
    elsif self.reviews.count == 1
      "1 review"
    else
      "#{self.reviews.count} reviews"
    end
  end

  def self.top_rated 
    self.joins(:reviews)
        .where( :reviews => { :rating => [4, 5] })
        .group('instructors.id')
        .order('AVG(reviews.rating) DESC, COUNT(reviews.id) DESC')
  end
end
