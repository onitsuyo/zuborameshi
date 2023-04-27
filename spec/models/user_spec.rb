require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録できる場合' do
      it '必要な情報を入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない場合' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'nameが11文字以上では登録できない' do
        @user.name = 'abcdefghijk'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is too long (maximum is 10 characters)"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複するemailがある場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email) 
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
    end
  end 
end
