# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :grade
  belongs_to :user

  validates :text, presence: true, length: { maximum: 255 }  
  validates :course_id, presence: true
  validates :course_id, presence: true
end
