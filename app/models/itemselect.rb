class Itemselect < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :condition
  belongs_to :delivery
  belongs_to :prefectures
  belongs_to :time

  validates :title, :text, presence: true

  validates :genre_id, numericality: { other_than: 1 } 

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
