require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @order = FactoryBot.build(:item_order)
  end
  describe '配送先の保存' do
    context '正常系' do
      it '必要条件が揃ったら保存できる' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも登録できる' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '異常系' do
      it 'postcodeが空だと登録できない' do
        @order.postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeハイフンなしだと登録できない' do
        @order.postcode = '12345678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'postcodeのハイフンの位置がずれると登録できない' do
        @order.postcode = '12-12345'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空だと登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが---だと登録できない' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと登録できない' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9文字以下だと登録できない' do
        @order.phone_number = '000000000'
        @order.valid?
      end
      it 'phone_numberが12文字以上だと登録できない' do
        @order.phone_number = '000000000000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberがハイフンありだと登録ができない' do
        @order.phone_number = '000-0000-000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空だと登録できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'order_idが空だと登録できない' do
        @order.order_id = nil
        @order.valid?

        expect(@order.errors.full_messages).to include("Order can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
