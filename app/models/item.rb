class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :history

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :state_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
