class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :city
    validates :block
    validates :user_id
    validates :item_id
    validates :order_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Consumer.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                    phone_number: phone_number, order_id: order.id)
  end
end
