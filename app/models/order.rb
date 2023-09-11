class Order < ApplicationRecord
    balongs_to :history

    VALID_POST_CODE_REGEX = /\A\d{3}-\d{4}\z/
    validates :post_code, precense: true, format: { with: VALID_POST_CODE_REGEX }
    validates :prefecture_id, precense: true
    validates :municipalities, precense: true
    validates :street_address, precense: true
    validates :telephone_number, precense: true, numericality: { only_integer: true },
    length: { minimum: 10, maximum: 11 }
end
