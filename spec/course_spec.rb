require './lib/course'
require './lib/student'

RSpec.describe Course do
  
  it 'can initialize' do
    course = Course.new("Calculus", 2)    
    expect(course).to be_instance_of(Course)
    expect(course.name).to eq("Calculus")
    expect(course.capacity).to eq(2)
    expect(course.students).to eq([])
    expect(course.full).to eq(false)
  end
end