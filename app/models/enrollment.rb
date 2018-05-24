# frozen_string_literal: true

class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_one :tracking, dependent: :destroy
end
