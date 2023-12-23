class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :ship_from_to
  belongs_to :days_to_ship_date

  validate :image_attached
  validates :name, :detail,presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :ship_from_to_id, presence: true
  validates :days_to_ship_date_id, presence: true

  validates :category_id, :condition_id, :shipping_charge_id, :ship_from_to_id, :days_to_ship_date_id, numericality: { only_integer: true, other_than: 1 , message: "can't be blank"}
  
  def image_attached
    unless image.attached?
      errors.add(:image, "can't be blank")
    end
  end
  
end
