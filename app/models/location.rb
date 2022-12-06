class Location < ApplicationRecord
  has_many :check_ins
  has_many :feedbacks
  has_many :users, through: :check_ins
  has_one :chatroom
  validates :address, :name, presence: true, uniqueness: true
  validates :location_type, presence: true
  has_many :videos, through: :feedbacks
  # validates :photos, presence: true, on: :create

  include PgSearch::Model
  # multisearchable against: [:name, :location_type, :address]
  pg_search_scope :search_by_name_and_address,
    against: [ :name, :address ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_location_type,
  against: [ :location_type ],
  using: {
    tsearch: { prefix: true }
  }
  end
