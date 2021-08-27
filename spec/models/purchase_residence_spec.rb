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
    end
end
