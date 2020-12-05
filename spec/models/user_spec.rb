require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー登録' do
    context 'ユーザー登録できる場合' do
      it 'nickname,email,password,password_confirmationが入力されている場合' do
        expect(@user).to be_valid
      end
      it 'nicknameが10文字以内の場合' do
        @user.nickname = "テスト用アカウント"
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上かつ英数字混合の場合' do
        @user.password = "test1111"
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない場合' do
      it 'nicknameがない場合' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'emailがない場合' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'passwordがない場合' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'password_confirmationがない場合' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it 'nicknameが10文字以上の場合' do
        @user.nickname = ('a' * 11)
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は10文字以内で入力してください")
      end
      it '同じemailがすでに存在する場合' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include("メールアドレスはすでに存在します")        
      end
      it 'passwordが5文字以内の場合' do
        @user.password = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが英文字のみの場合' do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが数字のみの場合' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角文字の場合' do
        @user.password = "あいうえおかきく"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordとpassword_confirmationが違う' do
        @user.password = "test123"
        @user.password_confirmation = "test4567"
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
    end
  end
end
