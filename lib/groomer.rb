class Groomer 
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers.push(customer)
  end

  def all_with_balance
    @customers.find_all do |customer| 
      customer.outstanding_balance >= 1
    end 
  end

  def total_owed
    @customers.map { |customer| customer.outstanding_balance }.sum
  end
  
  def count_pets(type)
    @customers.map do |customer|
      customer.pets.find_all do |pet|
        pet.type == type
      end
    end.length
  end
  
  
end 

