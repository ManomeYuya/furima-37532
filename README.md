# README

## users テーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|first_name              |string|null: false|
|last_name              |string|null: false|
|first_name_kana     |string|null: false|
|last_name_kana |string|null: false|

|email             |string|null: false, unique: true|
|encrypted_password|string|null: false|
|nickname          |string|null: false|
|birthday          |date|null: false|


### Association

 - has_many :items
 - has_many :purchase_managements
 

 ## items テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user             | references | null: false, foreign_key: true  |
| item_explanation       | text      | null: false |
| item_name        | string    | null: false |

| category_id      | integer  | null: false |
| product_condition_id| integer   | null: false |
| burden_of_shipping_charge_id   | integer    | null: false|
| delivery_area_id        | integer | null: false |
| days_to_ship_staring_id | integer| null: false |
| price                | integer | null: false |

### Association

 - belongs_to :user
 - has_one :purchase_management
 

 ## addresses テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
|purchase_management|references | null: false, foreign_key: true  |
| post_code        | string | null: false |
| delivery_area_id | integer| null: false |
| municipality     | string | null: false |
| house_number     | string | null: false |
| building_name    | string |
| telephone_number | string | null: false |

### Association

- belongs_to  : purchase_management


 ## purchase_managements テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association

 - belongs_to :user
 - belongs_to :item
 - has_one : address

