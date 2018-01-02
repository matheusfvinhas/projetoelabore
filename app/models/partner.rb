# frozen_string_literal: true

class Partner < ApplicationRecord
  validates :email, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :about, presence: true, length: { maximum: 5000 }
end
