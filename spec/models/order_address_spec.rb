require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end

      it '建物名がなくても保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end



    context '内容に問題がある場合' do
       it '郵便番号が空では保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンが含まれていないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では保存できないこと' do
        @order_address.shipping_region_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping region can't be blank")

      end
      it '市区町村が空では保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      
      

      

      it '番地が空では保存できないこと' do
        @order_address.address =''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end



      it '電話番号が空では保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が12桁以上では保存できないこと' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が9桁以下では保存できないこと' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号にハイフンが含まれていると保存できないこと' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では保存できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
