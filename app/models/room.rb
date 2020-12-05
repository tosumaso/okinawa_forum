class Room < ApplicationRecord
  
  belongs_to :post
  has_many :messages
  has_one :memo

  validates :name, presence: true, length: {maximum: 20}
end
