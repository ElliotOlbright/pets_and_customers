class Customer 
  attr_reader :name, :id, :pets, :outstanding_balance
  def initialize(name, id)
    @name = name
    @id = id 
    @pets = []
    @outstanding_balance = 0
  end 

  def adopt(pet)
    @pets.push(pet)
  end 

  def outstanding_balance
    @outstanding_balance
  end 

  def charge(price)
    @outstanding_balance += price
  end 
end 