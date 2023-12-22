class DaysToShipDate < ActiveHash::Base
  self.data = [
    { id: 1, days_to_ship_date: '---' },
    { id: 2, days_to_ship_date: '1～2日で発送' },
    { id: 3, days_to_ship_date: '2～3日で発送' },
    { id: 4, days_to_ship_date: '4～7日で発送' }

  ]

  include ActiveHash::Associations
  has_many :items

  end