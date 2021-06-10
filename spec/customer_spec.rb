require './lib/customer'
require './lib/pet'
require 'rspec'

RSpec.describe Customer do   
  describe 'Object Creation' do
    it 'exists' do
      joel = Customer.new("Joel", 2)
      expect(joel).to be_a(Customer)
    end

    it 'has readable attributes' do 
      joel = Customer.new("Joel", 2)
      expect(joel.name).to eq("Joel")
      expect(joel.id).to eq(2)
      expect(joel.pets).to eq([])
    end 
  end

  describe 'Object Methods' do
    it 'can adopt pets' do 
      joel = Customer.new("Joel", 2)
      samson = Pet.new({name: "Samson", type: :dog, age: 3})
      lucy = Pet.new({name: "Lucy", type: :cat, age: 12})    
      joel.adopt(samson)
      joel.adopt(lucy) 

      expect(joel.pets).to eq([samson, lucy])
    end 

    it 'can charge' do 
      joel = Customer.new("Joel", 2)
      samson = Pet.new({name: "Samson", type: :dog, age: 3})
      lucy = Pet.new({name: "Lucy", type: :cat, age: 12})  

      expect(joel.outstanding_balance).to eq(0)

      joel.charge(15)
      joel.charge(7)

      expect(joel.outstanding_balance).to eq(22)
    end 
  end
end