# frozen_string_literal: true

class Event < ApplicationRecord
  mount_uploaders :images, ImageUploader

    belongs_to :user
    
    validates :title, presence: true, length: { maximum: 100 }
    validates :description, presence: true, length: { maximum: 255 }
    validates :local, presence: true, length: { maximum: 100 }
    validates :date, presence: true
    validates :user_id, presence: true
end
