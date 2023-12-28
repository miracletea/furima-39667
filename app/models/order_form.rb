class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :ship_from_to_id, :city_town_village, :street_address, :building_name, :phone_number

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :token
  validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
  validates :ship_from_to_id
  validates :city_town_village
  validates :street_address
  validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  end


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

