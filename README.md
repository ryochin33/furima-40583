# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | ------------------------------- |
| user_id            | integer | PRIMARY KEY                     |
| nickname           | string  | NOT NULL                        |
| email              | string  | NOT NULL, UNIQUE                |
| encrypted password | string  | NOT NULL                        |
| last_name          | string  | NOT NULL                        |
| first_name         | string  | NOT NULL                        |
| last_name_kana     | string  | NOT NULL                        |
| first_name_kana    | string  | NOT NULL                        |
| birthdate          | date    | NOT NULL                        |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type    | Options                        |
| --------------------- | ------- | ------------------------------ |
| item_id               | integer | PRIMARY KEY                    |
| user_id               | integer | NOT NULL, FOREIGN KEY          |
| image_url             | string  | NOT NULL                       |
| item_name             | string  | NOT NULL, 最大40字             |
| item_description      | text    | NOT NULL, 最大1000字           |
| item_category         | string  | NOT NULL                       |
| item_condition        | string  | NOT NULL                       |
| item_shipping_burden  | string  | NOT NULL                       |
| item_shipping_region  | string  | NOT NULL                       |
| item_price            | integer | NOT NULL                       |

### Association

- belongs_to :user
- has_many :orders

## orders テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| order_id        | integer | PRIMARY KEY                    |
| user_id         | integer | NOT NULL, FOREIGN KEY          |
| item_id         | integer | NOT NULL, FOREIGN KEY          |
| phone_number    | string  | NOT NULL                       |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| address_id   | integer | PRIMARY KEY                    |
| order_id     | integer | NOT NULL, FOREIGN KEY          |
| postal_code  | string  | NOT NULL                       |
| prefecture   | string  | NOT NULL                       |
| city         | string  | NOT NULL                       |
| address      | string  | NOT NULL                       |
| building_name | string |                                |

### Association

- belongs_to :order
