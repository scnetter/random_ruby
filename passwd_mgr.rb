# Ruby will warn you if you change a constant
# User could be either a username or email. Could detect the '@' and change
# logic based on that.

# A constand can also just start with a Capital letter - doesn't have to be all caps
USER = "TESTUSER"
PASSWORD = "SUPERSECURE" # not!
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
  selection = gets.chomp
  puts "Select was #{selection}"
end
