# frozen_string_literal: true

class Tracking < ApplicationRecord
  belongs_to :enrollment
  belongs_to :grade
end
