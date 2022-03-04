
  require 'rails_helper'
  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
        it 'nickname:必須' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'password:必須' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'first_name:必須' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name:必須' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_name_kana:必須' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'last_name_kana:必須' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'birthday:必須' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        it 'password:半角英数字混合での入力必須' do
          
        end
        
        it 'password:半角英字のみでは登録できない' do
          @user.password = "abcdefg"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password パスワードには英字と数字の両方を含めて設定してください")
        end
        it 'first_name:全角での入力必須' do
          @user.first_name = "ああa"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
          
        end
        it 'last_name:全角での入力必須' do
          @user.last_name = "ああa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
          
        end
        it 'first_name_kana:全角カタカナのみでの入力必須' do
          @user.first_name_kana = "アアあ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カタカナのみを使用してください")
          
        end
        it 'last_name_kana:全角カタカナのみでの入力必須' do
          @user.last_name_kana = "アアあ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カタカナのみを使用してください")
          
        end
  end
  