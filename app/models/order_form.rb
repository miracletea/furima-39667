class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :ship_from_to_id, :city_town_village, :street_address, :building_name, :phone_number

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true
  validates :postal_code, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/ }
  validates :ship_from_to_id, presence: true
  validates :city_town_village, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/ }

  validates :ship_from_to_id, numericality: {other_than: 1 , message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    shipping_address = ShippingAddress.create(
      order_id: order.id,
      postal_code: postal_code,
      ship_from_to_id: ship_from_to_id,
      city_town_village: city_town_village,
      street_address: street_address,
      building_name: building_name,
      phone_number: phone_number
    )
  end
end

