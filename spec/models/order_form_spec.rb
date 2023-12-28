require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    # 既存のuserを作成
    user = FactoryBot.create(:user)
  
    # 既存のuserを指定してitemを作成
    item = FactoryBot.create(:item)
  
    # order_formを作成
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end


  describe '商品購入' do
    context '商品購入の配送先が登録できるとき' do
      it '郵便番号(postal_code)、都道府県(ship_from_to_id)、市区町村(city_town_village)、番地(street_address)、電話番号(phone_number)、token(token)が存在すれば登録できる' do
        expect(@order_form).to be_valid
      end
      it '建物名(building_name)が存在しなくても登録できる' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end
    context '商品購入の配送先が登録できないとき' do
      it '郵便番号(postal_code)が空では購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '都道府県(ship_from_to_id)が空では購入できない' do
        @order_form.ship_from_to_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Ship from to can't be blank")
      end
      it '市区町村(city_town_village)が空では購入できない' do
        # binding.pry
        @order_form.city_town_village = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City town village can't be blank")
      end
      it '番地(street_address)が空では購入できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号(phone_number)が空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '発送元の地域(ship_from_to_id )が初期値(---)では購入できない' do
        @order_form.ship_from_to_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Ship from to can't be blank")
      end
      it 'user_idが空では購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号(postal_code)は、「3桁ハイフン4桁」の半角文字列、以外は登録できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it '電話番号(phone_number)は、9桁未満の半角数値では登録できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号(phone_number)は、12桁以上の半角数値では登録できない' do
        @order_form.phone_number = '123456789111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号(phone_number)は、ハイフン「-」があると登録できない' do
        @order_form.phone_number = '080-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end