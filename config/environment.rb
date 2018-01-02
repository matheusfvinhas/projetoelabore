# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:event_time] = "%H:%M"
PRIMARY_BUTTONS_COLOR = "yellow darken-3".freeze
BACK_BUTTONS_COLOR = "grey".freeze
