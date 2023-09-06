class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :shipping_cost
    belongs_to :prefecture
    belongs_to :days_to_ship

    belongs_to :user

    has_one_attached :image


    validates :category_id, numericality: { other_than: 1 }
    validates :state_id, numericality: { other_than: 1 }
    validates :shipping_cost_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
end
