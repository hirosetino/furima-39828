class OrderHistory
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user, :item

    with_option precense: true do
        VALID_POST_CODE_REGEX = /\A\d{3}-\d{4}\z/
        validates :post_code,  format: { with: VALID_POST_CODE_REGEX }
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :municipalities
        validates :street_address
        validates :telephone_number, numericality: { only_integer: true },
        length: { minimum: 10, maximum: 11 }
        validates :history
        validates :user
        validates :item
    end

    def save
        order = Order.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, telephone_number: telephone_number, history: history.id)
        Address.create(user: user.id, item: item.id)
    end
end