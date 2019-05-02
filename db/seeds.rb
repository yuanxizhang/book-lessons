DATA = {
  :user_keys =>
    ["email", "password", "password_confirmation"],
  :users => [
    ["max.charles@gmail.com", "password", "password"],
    ["skai.jackson@gmail.com", "password", "password"],
    ["kaleo.elam@gmail.com", "password", "password"],
    ["megan.charpentier.com", "password", "password"],
    ["hayden.byerly@gmail.com", "password", "password"],
    ["tenzing.trainor@gmail.com", "password", "password"],
    ["davis.cleveland@gmail.com", "password", "password"],
    ["cole.sand@gmail.com", "password", "password"],
    ["kyle.wallis@gmail.com", "password", "password"]
  ],
  :lesson_keys =>
   ["title", "about", "price", "seats", "length", "requirement", "dates", "time", "available", "online", "address", "city", "state", "zipcode", "instructor_id", "skill_id"],
  :lessons => [
    ["Yoga on the beach", "Beach yoga is the practice of yoga in the relaxing setting of the beach, pairing the soothing influence of ocean waves with a calming yet energizing asana practice. Many studies have shown the stress-reducing qualities of yoga practice, but more recent research confirms that spending time near a body of water reduces stress. It's not just the sound of the crashing waves that melds nicely with a yoga practice. The smell of the beach, feel of the sand and sight of the seemingly endless water and sky all affect the brain in a way that creates a calming influence.", 100, 15, 1.5, "For students age 14+", "4 Saturdays in June 2019", "1:00 - 2:30 PM", true, false, "Baker Beach, Gibson Road", "San Francisco", "CA", "94129", 1, 1],
    ["Algebra I", "Topics to be covered include data organization; patterns and graphs; writing and solving equations; numeric, geometric, and algebraic ratios; slopes and rates of change; linear functions; factoring quadratics; graphing and systems of linear and nonlinear equations, area and sub problems; radicals and inequalities; exponents and quadratics; rational and irrational numbers; quadratic functions.", 1000, 30, 3.5, "For students who have completed grade 7 or 8.", "10 units 3 days a week MWF 06/17/2019 to 07/26/2019", "1:00 - 4:30 PM", true, false, "University of Berkeley", "Berkeley", "CA", "94720", 2, 2],
    ["Introduction to Sailing ", "This is about adventure, exuberance, exhilaration, and passion for the sea and sailing.  OCSC pskills itself on developing well rounded excellent sailors.  OCSC is known worldwide as producing elite sailors with a top-notch skill level.", 99, 6, 2, "for students age 18+", "First Saturday of June", "9:00 - 11:00 am", true, false, "1 Spinnaker Way", "Berkeley", "CA", "94710", 3, 3],
    ["First Year Japanese", "This course is based on a fun, playful, and effective approach to learning Japanese. This method is a synthesis of many innovative teaching techniques developed to help accelerate students’ language learning.", 950, 30, 3.5, "For students completing Grade 6 and up.", "10 unites, 3 times a week, MWF, 06/17/2019 to 07/26/2019", "8:30 am to 12:00 pm", true, false, "University of California Berkeley", "Berkeley", "CA", "94720", 4, 4],
    ["Introduction to Chemistry", "Throughout this course, laboratory activities and discussions will focus on how chemists describe matter and its changes within the context of alchemy and early chemistry.", 800, 30, 3.5, "For students completing Grade 8 and up.", "5 units, 2 days a week, Tuesdays and Thursdays, starts on 06/18/2019", "1:00 -4:30 pm", true, false, "University of California Berkeley", "Berkeley", "CA", "94720", 5, 5],
    ["Hands On Gourmet French Cooking class", " the french menu with different types of crostini, potato-leek soup, fennel salad, steak, couscous, mixed veggie ratatouille, pesto and chocolate cake with amaretto chocolate sauce. ", 50, 50, 2, "For students age 18+", "First Friday of June 2019", "12:30 pm - 2:30 pm", true, false, "2325 3rd St, Ste 409", "San Francisco", "CA", "94107", 6, 6]

  ],
  :admins => [
    "mary.long@gmail.com",
    "john.smith@gmail.com"
  ],
  :booking_keys =>
    ["user_id", "lesson_id", "full_name", "phone"],
  :bookings => [
    [1, 1, "Max Charles", "415-123-4567"],
    [2, 2, "Skai Jackson", "415-123-4567"],
    [3, 3, "Kaleo Elam", "415-123-4567"],
    [7, 4, "Davis Cleveland", "415-123-4567"],
    [8, 5, "Cole Sand", "415-123-4567"],
    [9, 6, "Kyle Wallis", "415-123-4567"]
  ],
  :instructor_keys =>
    ["name"],
  :instructors => [
    ["Julie"],
    ["Justine Song"],
    ["Anthony Sandberg"],
    ["Junko Hosoi"],
    ["Katy Kuei"],
    ["Stephen Gibbs"]
  ],
  :skill_keys =>
    ["name", "section_id"],
  :skills => [
    ["Yoga", 1],
    ["Math", 2],
    ["Sailing", 3],
    ["Japanese", 4],
    ["Chemistry", 2],
    ["French Cooking", 5]
  ],
  :section_keys =>
    ["name"],
  :sections => [
    ["Fitness and Wellness"],
    ["Academic Skills"],
    ["Sports"],
    ["Languages"],
    ["Cooking"]
  ]
}

def main
  # make_users
  make_admin
  # make_lessons
  # make_bookings
  # make_instructors
  # make_skills
  # make_sections
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |email|
    User.create(email: email, admin: true, password: 'password')
  end
end

def make_lessons
  DATA[:lessons].each do |lesson|
    new_lesson = Lesson.new
    lesson.each_with_index do |attribute, i|
      new_lesson.send(DATA[:lesson_keys][i] + "=", attribute)
    end
    new_lesson.save
  end
end

def make_bookings
  DATA[:bookings].each do |booking|
    new_booking = Booking.new
    booking.each_with_index do |attribute, i|
      new_booking.send(DATA[:booking_keys][i]+"=", attribute)
    end
    new_booking.save
  end
end

def make_instructors
  DATA[:instructors].each do |instructor|
    new_instructor = Instructor.new
    instructor.each_with_index do |attribute, i|
      new_instructor.send(DATA[:instructor_keys][i] + "=", attribute)
    end
    new_instructor.save
  end
end

def make_skills
  DATA[:skills].each do |skill|
    new_skill = Skill.new
    skill.each_with_index do |attribute, i|
      new_skill.send(DATA[:skill_keys][i]+"=", attribute)
    end
    new_skill.save
  end
end

def make_sections
  DATA[:sections].each do |section|
    new_section = Section.new
    section.each_with_index do |attribute, i|
      new_section.send(DATA[:section_keys][i] + "=", attribute)
    end
    new_section.save
  end
end

# def make_lessons_and_bookings
#   DATA[:lessons].each do |lesson|
#     new_lesson = Lesson.new
#     lesson.each_with_index do |attribute, i|
#       new_lesson.send(DATA[:lesson_keys][i] + "=", attribute)
#     end
#     rand(1..8).times do
#       customers = []
#       User.all.each {|u| customers << u if u.admin != true}
#       new_lesson.users << customers[rand(0...customers.length)]
#     end
#     new_lesson.users.each {|c| c.save}
#     new_lesson.save
#   end
# end

main
