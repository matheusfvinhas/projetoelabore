# frozen_string_literal: true

class Course < ApplicationRecord
  mount_uploader :document, DocumentUploader

  belongs_to :user
  has_many :grades, dependent: :destroy
  has_many :enrollments
  has_many :users, through: :enrollments

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :user_id, presence: true

end
