class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_region_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_region_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid"}
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end


class OrderShippingAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token
    with_options presence: true do
        validates :user_id
        validates :item_id
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ ,message: "is invalid. Enter it as follows (e.g. 123-4567)"}
        validates :prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"}
        validates :city
        validates :house_number
        validates :phone_number, format: { with: /\A\d{10,11}\z/ ,message:"is invalid. Input only number" }
        validates :token
    end
    def save
        order = Order.create(user_id: user_id, item_id: item_id)
        ShippingAddress.create(postal_code: postal_code, prefecture_id:prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end