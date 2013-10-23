class Person
  attr_accessor :name
  def greeting
    "Hi, my name is #{name}"
  end
end




class Student < Person
  
  def learn
   "I get it!"
  end
end

class Instructor < Person

  def teach
  "Everything in Ruby is an Object."
  end
end

chris = Student.new
chris.name
cristina = Instructor.new
cristina.name

s = Student.new
puts s.learn
i = Instructor.new
puts i.teach
puts s.teach # undefined method `teach' for #<Student:0x9570e50> (NoMethodError)

