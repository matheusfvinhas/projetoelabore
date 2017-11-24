# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:evento_data] = "%d/%m/%Y"