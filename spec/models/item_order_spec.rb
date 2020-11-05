require 'rails_helper'
RSpec.describe ItemOrder, type: :model do
  describe '購入時に必要な情報の保存' do
    before do
      @item_order = FactoryBot.build(:item_order)
    end

    context '購入がうまくいくとき' do
      it '必要な情報が存在するとき' do
        expect(@item_order).to be_valid
      end
      it '建物名が空でも購入ができる' do
        @item_order.building_name = nil
        expect(@item_order).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できない' do
        @item_order.postal_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフン(-)がないと購入できない' do
        @item_order.postal_code = '1234567'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Postal code Include hyphen(-)')
      end
      it '都道府県が選択されていないと購入できない' do
        @item_order.prefecture_id = ''
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの値が１のとき購入できない' do
        @item_order.prefecture_id = 1
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @item_order.address = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @item_order.phone = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号に全角だと購入できない' do
        @item_order.phone = '０００００００００００'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号にハイフン(-)が入ると購入できない' do
        @item_order.phone = '000-0000-0000'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
