class Review < ApplicationRecord
  belongs_to :user
  belongs_to :instructor

  validates :body, presence: true, allow_blank: false
  validates :rating, :inclusion => { :in => 1..5 }
  validates :instructor_id, presence: true
  validates :user_id, presence: true

  scope :most_recent, -> { order("created_at desc") }
end
