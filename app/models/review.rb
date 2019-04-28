class Review < ApplicationRecord
  belongs_to :user
  belongs_to :instructor

  validates :body, presence: true
  validates :rating, :inclusion => { :in => 1..5 }
end
