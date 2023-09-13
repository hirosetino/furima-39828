class HistoryOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone_number, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    history = History.create(user_id:, item_id:)

    Order.create(post_code:, prefecture_id:, municipalities:,
                 street_address:, telephone_number:, history_id: history.id)
  end
end
