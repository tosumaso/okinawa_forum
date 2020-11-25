class Room < ApplicationRecord
  
  has_many :room_users
  has_many :users, through: :room_users
  belongs_to :post
  has_many :messages
  has_one :memo
end
