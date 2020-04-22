class Student < ApplicationRecord
  def Student.students_sorted()
    #returns a list of students, sorted by descending classification then ascending name
    #Student sorting was only explicitly requested insofar as seeing which students are senior/junior
    #Other sorting could be added at later time, if desired
    return Student.order("classification DESC, name")
  end
end
