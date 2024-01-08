# Ruby will warn you if you change a constant
# User could be either a username or email. Could detect the '@' and change
# logic based on that.

# A constand can also just start with a Capital letter - doesn't have to be all caps
USER = "TESTUSER"
PASSWORD = "SUPERSECURE" # not!
PASSWORD_VAULT = {azure: {username: 'kelly', password: 'mwah'}}
=begin
I cannot truly express how grating it is to me that this was the first learning project.
As someone who has worked with and is involved in CyberSec... I feel triggered.
=end


puts "Generic - Totally Seucure (sic!) - Passowrd Manager"
puts "Please sign-in to continue."
print "Enter UserId (email or ID):"
user_id = gets.chomp

if user_id == USER
  print "Enter Password: "
  password = gets.chomp
else
  puts "Invalid or Unknown User."
  exit
end

unless password != PASSWORD
  puts "Welcome, ${user_id}."
  puts "Choose an option:"
  puts "1. Add new service credentials."
  puts "2. Retrieved existing credentials."
  puts "3. Exit"
  selection = gets.chomp
  puts "Select was #{selection}"
else
  puts "Invalid password."
  exit
end

case selection
when "1"
  print "Enter the nane of the service:"
  new_service = gets.chomp
  PASSWORD_VAULT[new_service] = {}
  print "Enter the username for the #{new_service} service:"
  new_service_username = gets.chomp
  PASSWORD_VAULT[new_service][:username] = new_service_username
  print "Enter the password for the #{new_service} service:"
  PASSWORD_VAULT[new_service][:password] = gets.chomp
  p PASSWORD_VAULT
when "2"
  print "What is the service name you wish to retrieve? "
  selected_service = gets.chomp
  credentials = PASSWORD_VAULT[selected_service.to_sym]

  puts "Here are the credentials for #{selected_service}:"
  credentials.each do |k, v|
    puts "#{k} #{v}"
  end
else
  puts "Exiting the program."
  exit
end
