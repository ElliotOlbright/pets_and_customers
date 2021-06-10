class Pet
  attr_reader :name, :type, :age
  def initialize(data_hash, fed = false)
    @name = data_hash[:name]
    @type = data_hash[:type]
    @age =  data_hash[:age]
    @fed = fed
  end 

  def fed?
    @fed 
  end 

  def feed 
    @fed = true
  end
end 