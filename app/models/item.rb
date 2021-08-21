class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :item_condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_zone_id, presence: true
  validates :category_id, presence: true
  validates :delivery_time_id, presence: true
end
