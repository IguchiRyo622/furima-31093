# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | strung | null: false |
| last_name_kana  | string | null: false |
| first_name      | string | null: false |
| first_name_kana | string | null: false |
| birth_year      | date   | null: false |
| birth_mouth     | date   | null: false |
| birth_day       | date   | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :records

## items テーブル

| Column             | Type   | Option      |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| info               | text   | null: false |
| price              | string | null: false |
| category           | date   | null: false |
| item_condition     | date   | null: false |
| shipping_fee       | date   | null: false |
| prefecture         | date   | null: false |
| scheduled_delivery | date   | null: false |

### Association
- belongs_to :user
- has_many :comments
- has_many :records

## comments テーブル

| Column  | Type   | Option      |
| ------- | ------ | ----------- |
| comment | text   | null: false |

### Association
- belongs_to :user
- belongs_to :item

## item_users テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_one :buyer
- belongs_to :user
- belongs_to :item

## buyers

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_cord   | string  | null: false |
| prefecture    | date    | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone         | integer | null: false |

### Association
- belongs_to :record