class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_time
  
  validates :name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_burden_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_region_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_time_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image, presence: true

  def calculate_fee
    (price * 0.1).floor
  end

  def calculate_profit
    price - calculate_fee
  end
end
