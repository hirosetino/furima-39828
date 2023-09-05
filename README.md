# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| email              | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_one :order

## items テーブル

| Column        | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| content       | text       | null: false                    |
| category      | string     | null: false                    |
| state         | string     | null: false                    |
| shipping_cost | string     | null: false                    |
| shipping_area | string     | null: false                    |
| days_to_ship  | string     | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| credit_number      | integer    | null: false                    |
| credit_expiry_date | string     | null: false                    |
| credit_cvv         | integer    | null: false                    |
| post_code          | integer    | null: false                    |
| prefectures        | string     | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | integer    | null: false                    |
| building_name      | string     |                                |
| telephone_number   | integer    | null: false                    |

### Association

- belongs_to :user
- has_many :items