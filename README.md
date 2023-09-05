# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| full_name          | string | null: false               |
| full_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_one :order
- belongs_to :history

## items テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefectures_id   | integer    | null: false                    |
| days_to_ship_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to :history

## orders テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## histories

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- has_many :users
- has_many :items