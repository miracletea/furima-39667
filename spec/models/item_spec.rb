require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 
  describe '商品出品' do
    context '商品出品できるとき' do
      it '商品画像(image)、商品名(name)、商品の説明(detail)、カテゴリー(category_id)、商品の状態(condition_id)、発送料の負担(shipping_charge_id)、発送元の地域(ship_from_to_id )、発送までの日数(days_to_ship_date_id)、価格(price)が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像(image)が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名(name)が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明(detail)が空では出品できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリー(category_id)が空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態(condition_id)が空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '発送料の負担(shipping_charge_id)が空では出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域(ship_from_to_id )が空では出品できない' do
        @item.ship_from_to_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from to can't be blank")
      end
      it '発送までの日数(days_to_ship_date_id)が空では出品できない' do
        @item.days_to_ship_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship date can't be blank")
      end
      it '価格(price)が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格(price)は300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格(price)は10,000,000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格(price)は全角では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'カテゴリー(category_id)が初期値(---)では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態(condition_id)が初期値(---)では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '発送料の負担(shipping_charge_id)が初期値(---)では出品できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '発送元の地域(ship_from_to_id )が初期値(---)では出品できない' do
        @item.ship_from_to_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from to can't be blank")
      end
      it '発送までの日数(days_to_ship_date_id)が初期値(---)では出品できない' do
        @item.days_to_ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship date can't be blank")
      end
      it 'userが紐づいてないときは出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

