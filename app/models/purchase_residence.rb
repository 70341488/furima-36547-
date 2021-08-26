class PurchaseResidence
  include ActiveModel::Model
  attr_accessor :user,  :item,  :purchase,  :delivery_zone_id,  :building_name, :post_number,  :municipalities, :address, :phone_number

  with_options presence: true do
    validates :user
    validates :item
    validates :purchase
    validates :municipalities
    validates :address
    validates :post_number, format: {with:  /\A\d{3}[-]\d{4}\z/,  message: "can't be blank"}
    validates :phone_number,format: {with:  /\A[0-90-9]\d{11}\z/, message: "can't be blank"}
  end
    validates :delivery_zone_id, numericality: { other_than: 1, message: "can't be blank" }
end