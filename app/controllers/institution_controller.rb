# frozen_string_literal: true

class InstitutionController < ApplicationController
  before_action :authenticate_user!
end
