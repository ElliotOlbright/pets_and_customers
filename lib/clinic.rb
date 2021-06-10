class Clinic 
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end 

  def add_customer(customer)
    @customers.push(customer)
  end

  def list_all_pets
      pets = @customers.flat_map do |customer|
        customer.pets.each do |pet|
          pet.age
        end
      end
      pets.sort_by {|pet| pet.age}
  end

  def count_pets(customer)
   customer.pets.length 
  end
end
