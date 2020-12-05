require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe 'ポスト投稿機能' do
    context '投稿できる場合' do
      it "name,contentが存在する場合" do
        expect(@post).to be_valid
      end
      it "nameが10文字以下の場合" do
        @post.name = "テスト"
        expect(@post).to be_valid
      end
      it "contentが200文字以下の場合" do
        @post.content = "テスト用のコンテンツです。"
        expect(@post).to be_valid
      end
      
    end
    context '投稿できない場合' do
      it "nameがない場合" do
        @post.name = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("名前を入力してください")
      end
      it "contentがない場合" do
        @post.content = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("本文を入力してください")
      end
      it "nameが10文字より多い場合" do
        @post.name = ('a' * 11)
        @post.valid?
        expect(@post.errors.full_messages).to include("名前は10文字以内で入力してください")
      end
      it "contentが200文字より多い場合" do
        @post.content = ('a' * 201)
        @post.valid?
        expect(@post.errors.full_messages).to include("本文は200文字以内のみ可")
      end
    end
  end
end
