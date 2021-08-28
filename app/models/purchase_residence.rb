class PurchaseResidence
  include ActiveModel::Model
  attr_accessor :user_id,  :item_id,  :purchase,  :delivery_zone_id,  :building_name, :post_number,  :municipalities, :address, :phone_number, :image, :price, :item_name, :delivery_fee_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipalities
    validates :address
    validates :token
    validates :post_number, format: {with:  /\A\d{3}[-]\d{4}\z/}
    validates :phone_number,format: {with: /\A[0-9]{11}\z/}
  end
    validates :delivery_zone_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)

      Residence.create(delivery_zone_id: delivery_zone_id, building_name: building_name, post_number: post_number, municipalities: municipalities, address: address, phone_number: phone_number, purchase_id: purchase.id,)
  end
end