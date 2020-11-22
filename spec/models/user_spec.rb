require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nameとemail、passwordとpassword_confirmation、last_nameとfirst_nameが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'emailが@を含めば登録できること' do
          @user.email = 'aaa@aaa.com'
          expect(@user).to be_valid
        end

        it 'passwordが半角英数字を含んだ6文字以上であれば登録できること' do
          @user.password = '123456ky'
          @user.password_confirmation = '123456ky'
          expect(@user).to be_valid
        end

        it 'last_nameが全角であれば登録できること' do
          @user.last_name = '田中'
          expect(@user).to be_valid
        end

        it 'first_nameが全角であれば登録できること' do
          @user.first_name = '太郎'
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまくいかないとき' do
        it 'nameが空では登録できないこと' do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameが空では登録できないこと' do
          @user.last_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'emailが@を含まなければ登録できないこと' do
          @user.email = 'aaaaaa.com'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = '123ky'
          @user.password_confirmation = '123ky'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordに全角文字が含まれる場合登録できないこと' do
          @user.password = '１２３４５６ky'
          @user.password_confirmation = '１２３４５６ky'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが半角数字のみであれば登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが半角英字のみであれば登録できないこと' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123456ky'
          @user.password_confirmation = '654321ky'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameに半角文字が含まれる場合登録できないこと' do
          @user.last_name = '田中a1'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end

        it 'last_nameに数字が含まれる場合登録できないこと' do
          @user.last_name = '田中１'
          @user.valid?
          expect(@user.errors.full_messages).to include('Last name is invalid')
        end

        it 'first_nameに半角文字が含まれる場合登録できないこと' do
          @user.first_name = '太郎b2'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end

        it 'first_nameに数字が含まれる場合登録できないこと' do
          @user.first_name = '太郎２'
          @user.valid?
          expect(@user.errors.full_messages).to include('First name is invalid')
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end
    end
  end
end
