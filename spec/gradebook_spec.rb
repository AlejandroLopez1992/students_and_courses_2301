require './lib/course'
require './lib/student'
require './lib/gradebook'

RSpec.describe Gradebook do

  it 'can initialize' do
    gradebook = Gradebook.new("Farnsworth")
    expect(gradebook).to be_instance_of(Gradebook)
    expect(gradebook.instructor).to eq("Farnsworth")
    expect(gradebood.courses).to eq([])
  end
end