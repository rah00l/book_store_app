# customer.rb

class Customer
  attr_accessor :name, :address, :email

  def initialize(name, address, email)
    @name = name
    @address = address
    @email = email
  end
end
