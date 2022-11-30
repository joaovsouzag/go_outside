class CheckIn < ApplicationRecord
  belongs_to :user
  belongs_to :location
  validates :user_id, uniqueness: true
end
