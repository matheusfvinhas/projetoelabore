# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:evento_data] = "%d/%m/%Y"
Time::DATE_FORMATS[:evento_hora] = "%H:%M"
PRIMARY_BUTTONS_COLOR = 'yellow darken-3'
BACK_BUTTONS_COLOR = 'grey'
