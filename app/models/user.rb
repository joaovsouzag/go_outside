class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :check_in
  has_many :favorites
  has_one_attached :photo
  validates :birthdate, presence: true
  validates :username, :email, presence: true, uniqueness: true
end
