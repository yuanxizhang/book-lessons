class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  validates :lesson_id, uniqueness: { scope: :user_id }

  def take_lesson
    if self.lesson.seats < 1
        "Sorry. This lesson is sold out!"
    elsif self.user.lessons.include? self.lesson
        "Sorry. You already booked this lesson!"
    else
        update_lesson
        "Thanks for booking the #{self.lesson.title} lesson!"
    end
  end

  def update_lesson
    if self.lesson.seats > 1
      self.lesson.seats = self.lesson.seats - 1
      self.lesson.save
    else
      self.lesson.seats = 0
      self.lesson.available = false
      self.lesson.save
    end
  end
end
