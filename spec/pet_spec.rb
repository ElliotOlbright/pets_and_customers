require 'rspec'
require './lib/pet'

RSpec.describe Pet do
  describe'Object Creation' do 

    it 'exists' do
      samson = Pet.new({name: "Samson", type: :dog, age: 3})  
      expect(samson).to be_a(Pet)
    end

    it 'has readabvle attributes' do
      samson = Pet.new({name: "Samson", type: :dog, age: 3})  
      expect(samson.name).to eq("Samson")
      expect(samson.type).to eq(:dog)
      expect(samson.age).to eq(3)
      expect(samson.fed?).to eq(false)
    end
  end

  describe 'Object Methods' do 
    it 'can eat' do
      samson = Pet.new({name: "Samson", type: :dog, age: 3})  
      expect(samson.fed?).to eq(false)
      samson.feed
      expect(samson.fed?).to eq(true)
    end 

  end 
end 