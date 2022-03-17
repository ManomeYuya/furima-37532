require 'rails_helper'

 RSpec.describe PurchaseManagementAddress, type: :model do 
  
   before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_management_address = FactoryBot.build(:purchase_management_address, user_id:user.id, item_id:item.id)
    sleep 0.1
 end
 describe '購入情報の保存' do
 context '内容に問題ない場合' do
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@purchase_management_address).to be_valid
  end
  it 'building_nameは空でも保存できること' do
    @purchase_management_address.building_name = ''
    expect(@purchase_management_address).to be_valid
  end
 end

 context '内容に問題がある場合' do
  it 'post_code:必須' do
    @purchase_management_address.post_code = ''
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("Post code can't be blank")
  end
  it 'post_code:半角のハイフンを含んだ正しい形式でないと保存できない' do
    @purchase_management_address.post_code = '1234567'
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
  end
  it 'post_code:半角文字以外では保存できない' do
    @purchase_management_address.post_code = '１２３−４５６７'
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
  end
  it 'municipality:必須' do
    @purchase_management_address.municipality = ''
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("Municipality can't be blank")
  end
  it 'house_number:必須' do
    @purchase_management_address.house_number = ''
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("House number can't be blank")
  end
  
  it 'telephone_number:電話番号が9桁以下であると保存できない' do
    @purchase_management_address.telephone_number = 000000000
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include('Telephone number 電話番号は10桁以上11桁以内のみ使用してください')
  end
  it 'telephone_number:電話番号が12桁以上であると保存できない' do
    @purchase_management_address.telephone_number = 000000000000
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include('Telephone number 電話番号は10桁以上11桁以内のみ使用してください')
  end
  it 'telephone_number:半角数字以外では保存できない' do
    @purchase_management_address.telephone_number = '１１１１１１１１１１１'
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("Telephone number 電話番号は半角数値のみ使用してください")
  end
  it "token:必須" do
    @purchase_management_address.token = nil
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("Token can't be blank")
  end
  it "user_id:必須" do
    @purchase_management_address.user_id = ''
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("User can't be blank")
  end
  it "item_id:必須" do
    @purchase_management_address.item_id = ''
    @purchase_management_address.valid?
    expect(@purchase_management_address.errors.full_messages).to include("Item can't be blank")
  end
 end
end
end