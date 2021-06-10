require './lib/customer'
require './lib/pet'
require './lib/daycare'
require './lib/groomer'
require 'rspec'

RSpec.describe Groomer do   
  before :each do 
    @groomer1 = Groomer.new("Paws4Lyfe")
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
    @groomer1.add_customer(@joel)
    @groomer1.add_customer(@jimmy)
  end 
  describe 'Object Creation' do
    it 'exists' do
      expect(@groomer1).to be_a(Groomer)
    end

    it 'has readable attributes' do 
      expect(@groomer1.name).to eq("Paws4Lyfe")
      expect(@groomer1.customers).to eq([@joel, @jimmy])
    end 
  end

  describe 'Object Methods' do
    it 'can find all customers with outstanding balance' do 
      @joel.charge(10)
      expect(@groomer1.all_with_balance).to eq([@joel])

      @jimmy.charge(45)
      expect(@groomer1.all_with_balance).to eq([@joel, @jimmy])
    end  

    it 'can return total owed' do 
      @joel.charge(10)
      @jimmy.charge(45)
      expect(@groomer1.total_owed).to eq(55)
    end
  end
end