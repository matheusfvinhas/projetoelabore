# frozen_string_literal: true

class Institution < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :manager, presence: true, length: { maximum: 50 }
end
