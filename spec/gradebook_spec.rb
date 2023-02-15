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
end