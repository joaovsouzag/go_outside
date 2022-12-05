class Location < ApplicationRecord
  has_many :check_ins
  has_many :feedbacks
  has_many :users, through: :check_ins
  validates :address, :name, presence: true
  validates :location_type, presence: true
  # validates :photos, presence: true, on: :create

  include PgSearch::Model
  multisearchable against: [:name, :location_type, :address]
  pg_search_scope :search_by_name_location_type_and_distance_and_address,
    against: [ :name, :location_type, :address ],
    using: {
      tsearch: { prefix: true }
    }
  end
