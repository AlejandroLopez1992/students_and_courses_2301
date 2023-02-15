class Gradebook
  attr_reader :instructor, :courses
  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses.push(course)
  end

  def list_all_students
    all_students = {}
    @courses.each do |course|
    all_students[course.name] = course.students 
    end
    all_students
  end
end
