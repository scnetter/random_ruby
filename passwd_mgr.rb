# Ruby will warn you if you change a constant
# User could be either a username or email. Could detect the '@' and change
# logic based on that.

# A constand can also just start with a Capital letter - doesn't have to be all caps
USER = "TESTUSER"
PASSWORD = "SUPERSECURE" # not!
PASSWORD_VAULT = {azure: {username: 'kelly', password: 'mwah'}}
=begin
I cannot truly express how grating it is to me that this was the first learning project.
As someone who has worked with and is involved in CyberSec... I feel triggered. :)
=end


def welcome_message
  puts "Generic - Totally Seucure (sic!) - Passowrd Manager"
end

def prompt_user_for_email
  puts "Please sign-in to continue."
  print "Enter UserId (email or ID):"
  gets.chomp
end

def verify_user_email(user_id)
  if user_id != USER
    puts "Invalid or Unknown User."
    exit
  end
end

def prompt_user_for_password
  print "Please enter your Password: "
  gets.chomp
end

def verify_user_password(user_password)
  if user_password != PASSWORD
    puts "Invalid password."
    exit
  end
end

def greet_user(user_email)
  puts "Welcome, ${user_id}."
end

def menu_options
  puts "Choose an option:"
  puts "1. Add new service credentials."
  puts "2. Retrieved existing credentials."
  puts "3. Exit"
end

def get_user_menu_selection
  gets.chomp
end

def handle_user_menu_selection(user_selection)
  case user_selection
  when "1"
    new_service = set_new_service_name
    set_username_for(new_service)
    set_password_for_service(new_service)
  when "2"
    print "What is the service name you wish to retrieve? "
    selected_service = get_service_name
    credentials = get_service_credentials(selected_service)
    display_service_credentials(selected_service, credentials)

  else
    exit_program
  end
end

def set_new_service_name
  print "Enter the nane of the service:"
  new_service = gets.chomp
  PASSWORD_VAULT[new_service.to_sym] = {}
  new_service
end

def set_username_for(new_service)
  print "Enter the username for the #{new_service} service:"
  new_service_username = gets.chomp
  PASSWORD_VAULT[new_service.to_sym][:username] = new_service_username
end

def set_password_for_service(new_service)
  print "Enter the password for the #{new_service} service:"
  PASSWORD_VAULT[new_service.to_sym][:password] = gets.chomp
end

def get_service_name
  print "What is the name of the service you'd like info on? "
  gets.chomp
end

def get_service_credentials(service_name)
  PASSWORD_VAULT[service_name.to_sym]
end

def display_service_credentials(service_name, credentials)
  puts "Here are the credentials for #{service_name}:"
    credentials.each do |k, v|
      puts "#{k}: #{v}"
    end
end

def exit_program
  puts "Exiting pgrogram."
  exit
end

welcome_message
user_email = prompt_user_for_email
verify_user_email(user_email)
user_password = prompt_user_for_password
verify_user_password(user_password)
while(true)
  menu_options
  user_selection = get_user_menu_selection
  handle_user_menu_selection(user_selection)
end
