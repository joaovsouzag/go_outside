class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :rating, presence: true
  has_many_attached :photos
  has_many_attached :videos
end
