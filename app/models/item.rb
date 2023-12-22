class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from_to
  belongs_to :days_to_ship_date
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :category_id, :condition_id, :shipping_charge_id, :ship_form_to_id, :days_to_ship_date_id, presence: true
  validates :price, presence: true

  validates :category_id, :condition_id, :shipping_charge_id, :ship_form_to_id, :days_to_ship_date_id, numericality: { other_than: 1 , message: "can't be blank"}

end
