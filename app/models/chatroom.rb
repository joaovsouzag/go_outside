class Chatroom < ApplicationRecord
  belongs_to :location
  has_many :messages
end
