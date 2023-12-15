# テーブル設計

## usersテーブル

| Column             | Type     | Options                   |
| ------------------ | ------   | ------------------------- |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birthday           | date     | null: false               |


### Association

- has_many :items
- has_one :records
- has_one :shipping_address

## itemsテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| name               | string      | null: false                     |
| detail             | text        | null: false                     |
| category           | string      | null: false                     |
| condition          | string      | null: false                     |
| shipping_charge    | string      | null: false                     |
| ship_form          | string      | null: false                     |
| days_to_ship_date  | string      | null: false                     |
| price              | integer     | null: false                     |
| user               | reference   | null: false, foreign_key: true  |


### Association

- belongs_to :users
- has_one :records

## shipping_addressテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| postal_code        | string      | null: false                     |
| city_Town_village  | string      | null: false                     |
| street_address     | string      | null: false                     |
| building_name      | string      |                                 |
| phone_number       | integer     | null: false                     |
| user               | references  | null: false, foreign_key: true  |


### Association

- belongs_to :users


## recordsテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |


### Association

- belongs_to :users
- belongs_to :items