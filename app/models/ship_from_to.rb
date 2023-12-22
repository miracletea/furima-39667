class Ship_from_to < ActiveHash::Base
  self.data = [
    {id: 1, ship_from_to: '---'},
    {id: 2, ship_from_to: '北海道'}, {id: 3, ship_from_to: '青森県'}, {id: 4, ship_from_to: '岩手県'},
    {id: 5, ship_from_to: '宮城県'}, {id: 6, ship_from_to: '秋田県'}, {id: 7, ship_from_to: '山形県'},
    {id: 8, ship_from_to: '福島県'}, {id: 9, ship_from_to: '茨城県'}, {id: 10, ship_from_to: '栃木県'},
    {id: 11, ship_from_to: '群馬県'}, {id: 12, ship_from_to: '埼玉県'}, {id: 13, ship_from_to: '千葉県'},
    {id: 14, ship_from_to: '東京都'}, {id: 15, ship_from_to: '神奈川県'}, {id: 16, ship_from_to: '新潟県'},
    {id: 17, ship_from_to: '富山県'}, {id: 18, ship_from_to: '石川県'}, {id: 19, ship_from_to: '福井県'},
    {id: 20, ship_from_to: '山梨県'}, {id: 21, ship_from_to: '長野県'}, {id: 22, ship_from_to: '岐阜県'},
    {id: 23, ship_from_to: '静岡県'}, {id: 24, ship_from_to: '愛知県'}, {id: 25, ship_from_to: '三重県'},
    {id: 26, ship_from_to: '滋賀県'}, {id: 27, ship_from_to: '京都府'}, {id: 28, ship_from_to: '大阪府'},
    {id: 29, ship_from_to: '兵庫県'}, {id: 30, ship_from_to: '奈良県'}, {id: 31, ship_from_to: '和歌山県'},
    {id: 32, ship_from_to: '鳥取県'}, {id: 33, ship_from_to: '島根県'}, {id: 34, ship_from_to: '岡山県'},
    {id: 35, ship_from_to: '広島県'}, {id: 36, ship_from_to: '山口県'}, {id: 37, ship_from_to: '徳島県'},
    {id: 38, ship_from_to: '香川県'}, {id: 39, ship_from_to: '愛媛県'}, {id: 40, ship_from_to: '高知県'},
    {id: 41, ship_from_to: '福岡県'}, {id: 42, ship_from_to: '佐賀県'}, {id: 43, ship_from_to: '長崎県'},
    {id: 44, ship_from_to: '熊本県'}, {id: 45, ship_from_to: '大分県'}, {id: 46, ship_from_to: '宮崎県'},
    {id: 47, ship_from_to: '鹿児島県'}, {id: 48, ship_from_to: '沖縄県'}

  ]

  include ActiveHash::Associations
  has_many :items

  end