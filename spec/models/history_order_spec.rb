require 'rails_helper'

RSpec.describe HistoryOrder, type: :model do
  before do
    @history_order = FactoryBot.build(:history_order)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
        it 'post_code, prefecture_id, municipalities, street_address, building_name, telephone_number, user_id, item_id, tokenが存在すれば購入できる' do
          expect(@history_order).to be_valid
        end
        it 'building_nameが無くても購入できる' do
          @history_order.building_name = ''
          expect(@history_order).to be_valid
        end
    end

    context '商品購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @history_order.post_code = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'prefecture_idが空だと購入できない' do
        @history_order.prefecture_id = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @history_order.municipalities = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空だと購入できない' do
        @history_order.street_address = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephone_numberが空だと購入できない' do
        @history_order.telephone_number = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @history_order.user_id = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @history_order.item_id = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @history_order.token = ''
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeに-がないと購入できない' do
        @history_order.post_code = '1234567'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Post code is invalid")
      end
      it 'prefecture_idが1だと購入できない' do
        @history_order.prefecture_id = '1'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'telephone_numberに全角数字が入っていると購入できない' do
        @history_order.telephone_number = '123456789０'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Telephone number is not a number")
      end
      it 'telephone_numberに文字が入っていると購入できない' do
        @history_order.telephone_number = '123456789十'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Telephone number is not a number")
      end
      it 'telephone_numberが9桁以下だと購入できない' do
        @history_order.telephone_number = '123456789'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")
      end
      it 'telephone_numberが12桁以上だと購入できない' do
        @history_order.telephone_number = '123456789012'
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
      end
    end
  end
end
