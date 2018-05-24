# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events
  has_many :notices
  has_many :enrollments
  has_many :courses, through: :enrollments
  belongs_to :institution

  devise :database_authenticatable, :recoverable, :registerable
  enum kind: %i[admin teacher student]

  validates :email, presence: true
  validates :username, length: { maximum: 20 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :telephone, length: { maximum: 15 }
  validates :mini_cv, length: { maximum: 5000 }
  validates :kind, presence: true
  validates :institution_id, presence: true
end
