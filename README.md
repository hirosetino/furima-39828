# テーブル設計

## users テーブル

| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :histories

## items テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| content          | text       | null: false                    |
| category_id      | integer    | null: false                    |
| state_id         | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| days_to_ship_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :history

## orders テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| history            | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipalities     | string     | null: false                    |
| street_address     | string     | null: false                    |
| building_name      | string     |                                |
| telephone_number   | string     | null: false                    |

### Association

- belongs_to :history

## histories

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order