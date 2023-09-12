class HistoryOrder
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user_id, :item_id, :token

    with_options presence: true do
        validates :post_code,  format: { with: /\A\d{3}-\d{4}\z/ }
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :municipalities
        validates :street_address
        validates :telephone_number, numericality: { only_integer: true },length: { minimum: 10, maximum: 11 }
        validates :user_id
        validates :item_id
        validates :token
    end

    def save
        history = History.create(user_id: user_id, item_id: item_id)

        Order.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, telephone_number: telephone_number, history_id: history.id)
    end
end