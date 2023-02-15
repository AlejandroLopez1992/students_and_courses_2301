require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do

  it 'can initialize' do
    gradebook = Gradebook.new("Farnsworth")
    expect(gradebook).to be_instance_of(Gradebook)
    expect(gradebook.instructor).to eq("Farnsworth")
    expect(gradebook.courses).to eq([])
  end

  it 'can add courses' do
    gradebook = Gradebook.new("Farnsworth")
    expect(gradebook.courses).to eq([])
    mars_physics = Course.new("Mars Physics", 10)
    interstellar_travel = Course.new("Interstellar Travel", 5)
    gradebook.add_course(mars_physics)
    gradebook.add_course(interstellar_travel)
    expect(gradebook.courses).to eq([mars_physics, interstellar_travel])
  end

  it 'can list students in courses' do
    gradebook = Gradebook.new("Farnsworth")
    mars_physics = Course.new("Mars Physics", 10)
    interstellar_travel = Course.new("Interstellar Travel", 5)
    amy_wong = Student.new({name: "Amy Wong", age: 21}) 
    bender = Student.new({name: "Bender", age: 22})
    mars_physics.enroll(amy_wong)
    mars_physics.enroll(bender)
    interstellar_travel.enroll(amy_wong)
    interstellar_travel.enroll(bender)
    gradebook.add_course(mars_physics)
    gradebook.add_course(interstellar_travel)
    expect(mars_physics.students).to eq([amy_wong, bender])
    expect(interstellar_travel.students).to eq([amy_wong, bender])
    expect(gradebook.list_all_students).to eq({mars_physics.name => [amy_wong, bender],
                                                interstellar_travel.name => [amy_wong, bender]})
  end

  it 'can add method to see students under threshhold' do
    gradebook = Gradebook.new("Farnsworth")
    mars_physics = Course.new("Mars Physics", 10)
    interstellar_travel = Course.new("Interstellar Travel", 5)
    amy_wong = Student.new({name: "Amy Wong", age: 21}) 
    bender = Student.new({name: "Bender", age: 22})
    mars_physics.enroll(amy_wong)
    mars_physics.enroll(bender)
    interstellar_travel.enroll(amy_wong)
    interstellar_travel.enroll(bender)
    gradebook.add_course(mars_physics)
    gradebook.add_course(interstellar_travel)
    amy_wong.log_score(89)
    amy_wong.log_score(100)
    bender.log_score(100)
    bender.log_score(20)
    expect(gradebook.students_below(80)).to eq([bender])
  end
end