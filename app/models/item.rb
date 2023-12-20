class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :ship_form_to_id, presence: true
  validates :days_to_ship_date_id, presence: true
  validates :price, presence: true

end
