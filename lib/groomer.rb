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
    
  end 
  
  
end 

