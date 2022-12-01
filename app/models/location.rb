class Location < ApplicationRecord
  has_many :check_ins
  has_many :feedbacks
  has_many :users, through: :check_ins
  validates :address, :name, presence: true, uniqueness: true
  validates :location_type, presence: true
  # validates :photos, presence: true, on: :create
end
