# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :events
  has_many :notices

  devise :database_authenticatable, :recoverable, :registerable
  enum kind: %i[admin teacher student]

  validates :email, presence: true
  validates :username, length: { maximum: 20 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :responsible, presence: true, length: { maximum: 50 }
  validates :telephone, length: { maximum: 15 }
  validates :mini_cv, length: { maximum: 5000 }
  validates :kind, presence: true
end
