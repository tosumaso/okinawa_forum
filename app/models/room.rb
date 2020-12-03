class Room < ApplicationRecord
  
  belongs_to :post
  has_many :messages
  has_one :memo

  validates :name, presence: true
end
