class Instructor < ApplicationRecord
  mount_uploader :picture, PictureUploader

  has_many :lessons, :dependent => :destroy
  has_many :skills, through: :lessons
  has_many :reviews, :dependent => :destroy
  has_many :users, through: :reviews

  validates :name, presence: true

  accepts_nested_attributes_for :reviews

  def average_rating
      if self.reviews.size > 0
          self.reviews.average(:rating)
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
end
