# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:evento_data] = "%d/%m/%Y - %I:%M%p"