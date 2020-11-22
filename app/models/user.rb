class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :posts
  has_many :messages
end
