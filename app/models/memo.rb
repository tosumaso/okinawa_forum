class Memo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :url
  belongs_to :room
end
