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
p user_id
