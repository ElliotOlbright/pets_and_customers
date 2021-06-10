require './lib/customer'
require './lib/pet'
require './lib/daycare'
require './lib/groomer'
require './lib/clinic'
require 'rspec'

RSpec.describe Clinic do   
  before :each do 
    @clinic1 = Clinic.new("Paws4Lyfe")
    @joel = Customer.new("Joel", 2)
    @jimmy = Customer.new("Jimmy", 1)
    @samson = Pet.new({name: "Samson", type: :dog, age: 3})
    @lucy = Pet.new({name: "Lucy", type: :cat, age: 12}) 
    @lady = Pet.new({name: "Lady", type: :dog, age: 1}) 
    @squirrel = Pet.new({name: "Squirrel", type: :cat, age: 420}) 
    @joel.adopt(@samson)
    @joel.adopt(@lucy) 
    @jimmy.adopt(@lady)
    @jimmy.adopt(@squirrel)
    @clinic1.add_customer(@joel)
    @clinic1.add_customer(@jimmy)
  end 
  describe 'Object Creation' do
    it 'exists' do
      expect(@clinic1).to be_a(Clinic)
    end

    it 'has readable attributes' do 
      expect(@clinic1.name).to eq("Paws4Lyfe")
      expect(@clinic1.customers).to eq([@joel, @jimmy])
    end 
  end

  describe 'Object Methods' do
    it 'can list all pets sorted by age' do
      expect(@clinic1.list_all_pets).to eq ([@lady, @samson, @lucy, @squirrel ])
    end
    
    it 'can count a customers pets' do 
      expect(@clinic1.count_pets(@joel)).to eq(2)
    end
  end 
end 