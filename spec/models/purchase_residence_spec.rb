require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  describe '購入先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @purchase_residence = FactoryBot.build(:purchase_residence, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_residence).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_residence.building_name = ''
        expect(@purchase_residence).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できないこと' do
        @purchase_residence.post_number = ''
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Post number can't be blank", 'Post number is invalid')
      end
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_residence.post_number = '1234567'
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Post number is invalid')
      end
      it 'delivery_zone_idを選択していないと保存できないこと' do
        @purchase_residence.delivery_zone_id = 1
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Delivery zone can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_residence.municipalities = ''
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressがないと保存できないこと' do
        @purchase_residence.address = ''
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberないと保存できないこと' do
        @purchase_residence.phone_number = ''
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは半角数値でないと保存できないこと' do
        @purchase_residence.phone_number = '４５４ひsdw'
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは10桁以上じゃないと保存できないこと' do
        @purchase_residence.phone_number = 999_999_999
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは11桁以下じゃないと保存できないこと' do
        @purchase_residence.phone_number = 999_999_999_999
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include('Phone number is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_residence.user_id = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_residence.token = nil
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
