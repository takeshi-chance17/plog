require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての情報が正常に入力されている' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'test00'
        @user.password_confirmation = 'test00'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailが＠を含まなければ登録できないこと' do
        @user.email = 'test1234'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'emailが重複したメールアドレスでは登録できないこと' do
        @user.save
        @another = FactoryBot.build(:user)
        @another.email = @user.email
        @another.valid?
        expect(@another.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが６文字以上でないと登録できないこと' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width alphanumeric characters.'
      end
      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width alphanumeric characters.'
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = 'ＡＢＣＤＥＦ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Input half-width alphanumeric characters.'
      end
      it 'password_confirmationがpasswordと異なっていたら登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
      end
      it 'first_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.first_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
      end
      it 'last_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
      end
      it 'first_name_readが空では登録できない' do
        @user.first_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name read is invalid. Input full-width katakana characters.'
      end
      it 'first_name_readが全角カタカナ以外では登録できない' do
        @user.first_name_read = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name read is invalid. Input full-width katakana characters.'
      end
      it 'last_name_readが空では登録できない' do
        @user.last_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name read is invalid. Input full-width katakana characters.'
      end
      it 'last_name_readが全角カタカナ以外では登録できない' do
        @user.last_name_read = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name read is invalid. Input full-width katakana characters.'
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end
