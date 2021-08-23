class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, numericality: { with: /\A[0-9]+\z/ }
  validates :item_condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_zone_id, presence: true
  validates :category_id, presence: true
  validates :delivery_time_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :delivery_zone
  belongs_to :delivery_time


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_zone_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"} 
end