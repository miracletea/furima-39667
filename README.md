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
- has_many :records
- has_many :sns_credentials
- has_many :comments

## itemsテーブル

| Column                | Type        | Options                         |
| --------------------- | ----------- | ------------------------------- |
| name                  | string      | null: false                     |
| detail                | text        | null: false                     |
| category_id           | integer     | null: false                     |
| condition_id          | integer     | null: false                     |
| shipping_charge_id    | integer     | null: false                     |
| ship_from_to_id       | integer     | null: false                     |
| days_to_ship_date_id  | integer     | null: false                     |
| price                 | integer     | null: false                     |
| user                  | references  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :record
- has_many :comments, dependent: :destroy

## shipping_addressesテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| postal_code        | string      | null: false                     |
| ship_from_to_id    | integer     | null: false                     |
| city_town_village  | string      | null: false                     |
| street_address     | string      | null: false                     |
| building_name      | string      |                                 |
| phone_number       | string      | null: false                     |
| order              | references  | null: false, foreign_key: true  |


### Association

- belongs_to :record


## ordersテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## sns_credentialsテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| provider           | string      | null: false                     |
| uid                | string      | null: false                     |
| user               | references  | null: false, foreign_key: true  |



### Association

- belongs_to :user


## commentsテーブル

| Column             | Type        | Options                         |
| ------------------ | ----------- | ------------------------------- |
| text               | text        | null: false                     |
| user               | references  | null: false, foreign_key: true  |
| item               | references  | null: false, foreign_key: true  |



### Association

- belongs_to :user
- belongs_to :item