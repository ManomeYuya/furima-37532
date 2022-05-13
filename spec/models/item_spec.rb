require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id) #item（model）とuser.idをuser_idに入れたものを@itemに代入
  end

  describe '商品出品機能' do
    context '出品ができるとき' do
       it "すべての情報が入力されているとき" do
        expect(@item).to be_valid
       end
      end
    context '出品ができないとき' do
      it 'user:出品者が紐付いていなければ出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_name:必須' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の名前を入力してください")
      end
      it 'item_explanation:必須' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'image:必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の画像を入力してください")
      end

      it 'price:必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'price:半角数字以外では保存できない' do
        @item.price = '５５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格価格は半角数値のみ使用してください")
      end
      it 'price:¥300以下の場合は保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("価格価格は¥300~9,999,999の間で設定してください")
      end
      it 'price:¥9,999,999以上の場合は保存できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格価格は¥300~9,999,999の間で設定してください")
      end

      it 'category_id:初期値を選んだ場合は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Categoryは1以外の値にしてください")
      end
      it 'product_condition_id,:初期値を選んだ場合は保存できない' do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product conditionは1以外の値にしてください")
      end
      it 'burden_of_shipping_charge_id,:初期値を選んだ場合は保存できない' do
        @item.burden_of_shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of shipping chargeは1以外の値にしてください")
      end
      it 'delivery_area_id,:初期値を選んだ場合は保存できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery areaは1以外の値にしてください")
      end
      it 'days_to_ship_staring_id,:初期値を選んだ場合は保存できない' do
        @item.days_to_ship_staring_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship staringは1以外の値にしてください")
      end
    end
 end
end