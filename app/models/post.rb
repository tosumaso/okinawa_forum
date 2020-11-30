class Post < ApplicationRecord
  belongs_to :user
  has_one :room

  validates :name, presence: {message: 'を入力してください'}
  validates :content, presence: {message: 'を入力してください'}, length: {maximum: 200, message: 'は200文字以内のみ可'}
end
