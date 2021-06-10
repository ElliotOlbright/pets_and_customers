require './lib/customer'
require './lib/pet'
require './lib/daycare'
require 'rspec'

RSpec.describe Daycare do   
  describe 'Object Creation' do
    it 'exists' do
      daycare1 = Daycare.new("Paws4Lyfe")
      expect(daycare1).to be_a(Daycare)
    end

    it 'has readable attributes' do 
      daycare1 = Daycare.new("Paws4Lyfe")
      expect(daycare1.name).to eq("Paws4Lyfe")
      expect(daycare1.customers).to eq([])

    end 
  end

  describe 'Object Methods' do
    before :each do 
      @daycare1 = Daycare.new("Paws4Lyfe")
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
      @daycare1.add_customer(@joel)
      @daycare1.add_customer(@jimmy)
    end
    it 'can add custoemrs' do
      expect(@daycare1.customers).to eq([@joel, @jimmy])
      expect(@daycare1.all_pets).to eq([@samson, @lucy, @lady, @squirrel])
    end 

    it 'can find customer by id' do 
      expect(@daycare1.find_by_id(1)).to eq (@jimmy)
      expect(@daycare1.find_by_id(2)).to eq (@joel)
    end 

    it 'can find customer by id' do 
      expect(@daycare1.find_unfed).to eq ([@samson, @lucy, @lady, @squirrel])

      @lady.feed
      @squirrel.feed
   
      expect(@daycare1.find_unfed).to eq ([@samson, @lucy])
    end 

    it 'can charge a customer' do 
      @daycare1.feed_all

      expect(@joel.outstanding_balance).to eq(22)
      expect(@samson.fed?).to eq(true)
      expect(@lucy.fed?).to eq(true)
      expect(@jimmy.outstanding_balance).to eq(22)
      expect(@lady.fed?).to eq(true)
      expect(@squirrel.fed?).to eq(true)
    end
  end  
end 