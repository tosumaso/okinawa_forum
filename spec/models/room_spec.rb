require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe 'ルーム作成機能' do
    context 'ルーム作成できる場合' do
      it 'nameが存在する場合' do
        expect(@room).to be_valid
      end
      it 'nameが20文字以内の場合' do
        @room.name = "テストルーム作成"
        expect(@room).to be_valid
      end
    end
    context 'ルーム作成できない場合' do
      it 'nameが存在しない場合' do
        @room.name = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("名前を入力してください")
      end
      it 'nameが20文字を越す場合' do
        @room.name = ('a' * 21)
        @room.valid?
        expect(@room.errors.full_messages).to include("名前は20文字以内で入力してください")
      end
    end
  end
end
