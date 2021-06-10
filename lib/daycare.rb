class Daycare 
  attr_reader :name, :customers, :animal_cost
  def initialize(name)
    @name = name
    @customers = []
    @animal_cost = { dog: 15, cat: 7 }
  end 

  def add_customer(customer)
    @customers.push(customer)
  end

  def all_pets
    @customers.flat_map { |customer| customer.pets }
  end 

  def find_by_id(id)
    @customers.find { |customer| customer.id == id }
  end 

  def find_unfed
    @customers.map do |customer|
      customer.pets.find_all do |pet|
        pet.fed? == false
      end
    end.flatten
  end 

  def feed_all 
    @customers.each do |customer|
      customer.pets.each do |pet|
        next if pet.fed?
        pet.feed
        customer.charge(animal_cost[pet.type])
      end   
    end
  end 
end 