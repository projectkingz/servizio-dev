require_relative 'crud'

class Client
  include Crud
  attr_accessor :first_name, :last_name, :email, :username, :password

  def initialize(first_name, last_name, username, email, password)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    @password = password
  end

  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username}, Email: #{@email}"
  end

end

nyati = Client.new("Thabani", "Nyati", "nyati1", "drthabani@hotmail.com" , "password1")
smith = Client.new("John", "Smith", "smith1", "john1@hotmail.com" , "password2")

hashed_password = nyati.create_hash_digest(nyati.password)

puts hashed_password
