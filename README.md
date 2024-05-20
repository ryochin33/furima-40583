# README

# テーブル設計

## users テーブル

| Column             | Type    | Options                         |
| ------------------ | ------- | ------------------------------- |
| nickname           | string  | NOT NULL                        |
| email              | string  | NOT NULL, UNIQUE                |
| encrypted_password | string  | NOT NULL                        |
| last_name          | string  | NOT NULL                        |
| first_name         | string  | NOT NULL                        |
| last_name_kana     | string  | NOT NULL                        |
| first_name_kana    | string  | NOT NULL                        |
| birthdate          | date    | NOT NULL                        |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | -------    | ------------------------------ |
| user                  | references | NOT NULL, FOREIGN KEY          |
| name                  | string     | NOT NULL, 最大40字             |
| description           | text       | NOT NULL, 最大1000字           |
| category_id           | integer    | NOT NULL                       |
| condition_id          | integer    | NOT NULL                       |
| shipping_burden_id    | integer    | NOT NULL                       |
| shipping_region_id    | integer    | NOT NULL                       |
| shipping_time_id      | integer    | NOT NULL                       |
| price                 | integer    | NOT NULL                       |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | -------    | ------------------------------ |
| user            | references | NOT NULL, FOREIGN KEY          |
| item            | references | NOT NULL, FOREIGN KEY          |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------       | -------    | ------------------------------ |
| order              | references | NOT NULL, FOREIGN KEY          |
| postal_code        | string     | NOT NULL                       |
| shipping_region_id | integer    | NOT NULL                       |
| city               | string     | NOT NULL                       |
| address            | string     | NOT NULL                       |
| building_name      | string     |                                |
| phone_number       | string     | NOT NULL                       |
### Association

- belongs_to :order
