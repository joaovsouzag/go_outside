class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :rating, presence: true
end
