require './lib/student'

RSpec.describe Student do
  
  it 'can initialize' do
    student = Student.new({name: "Morgan", age: 21}) 
    expect(student).to be_instance_of(Student)
    expect(student.name).to eq("Morgan")
    expect(student.age).to eq(21)
    expect(student.scores).to eq([])
  end

  it 'student can save scores with log_score' do
    student = Student.new({name: "Morgan", age: 21}) 
    student.log_score(89)
    student.log_score(78)    
    expect(student.scores).to eq([89, 78])
  end
end