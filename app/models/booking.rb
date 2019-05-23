class Booking < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  def take_lesson
    if self.lesson.seats < 1
        "Sorry. This lesson is sold out!"
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
