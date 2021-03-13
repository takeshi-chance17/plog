# README

# テーブル設計


# 更新あり
## users テーブル
| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| email              | string    | unique: true, null: false |
| encrypted_password | string    | null: false |
| nickname           | string    | null: false |
| last_name          | string    | null: false |
| first_name         | string    | null: false |
| last_name_read     | string    | null: false |
| first_name_read    | string    | null: false |
| birth_day          | date      | null: false |

### Association
- has_many  :items
- has_many  :buy_histories

## items テーブル
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| name            | string    | null: false |  商品名
| description     | text      | null: false |  商品説明
| price           | integer   | null: false |  販売価格
| status_id       | integer   | null: false |  発送までの日数
| condition_id    | integer   | null: false |  商品の状態
| delivery_fee_id | integer   | null: false |  配送料の負担
| category_id     | integer   | null: false |  カテゴリー
| prefecture_id   | integer   | null: false |  発送元の地域
| user            | reference | null: false, foreign_key: true |  出品者名

### Association
- belongs_to   :user
- has_one      :buy_history

## buyer テーブル(購入者情報)
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| phone_number  | string    | null: false |  電話番号
| postal_code   | string    | null: false |  郵便番号
| prefecture_id | int       | null: false |  都道府県
| city          | string    | null: false |  市町村
| house_number  | string    | null: false |  番地
| building_name | string    |             |  建物名
| buy_history   | reference | null: false, foreign_key: true |  購入履歴

### Association
- belongs_to  :buy_history


## buy_historyテーブル(購入履歴)
| Column          | Type      | Options     |
| --------------- | --------- | ----------- |
| item            | reference | null: false, foreign_key: true |
| user            | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :buyer
- belongs_to :item
