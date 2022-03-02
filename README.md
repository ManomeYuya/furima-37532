# README

## users 　テーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|first_name              |staring|null: false|
|last_name              |staring|null: false|
|first_name(フリガナ)      |staring|null: false|
|last_name(フリガナ) |staring|null: false|

|email             |staring|null: false, unique: true|
|encrypted_password|staring|null: false|
|nickname          |staring|null: false|
|birthday          |date|null: false|


### Association

 - has_many :items
 - has_many :Purchase managements
 - has_one : address
 



 ## items テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user             | references | null: false, foreign_key: true  |
| item_image       | text      | null: false |
| item_name        | string    | null: false |

| category_id      | integer  | null: false |
| item_content_id     | integer  | null: false |
| Product condition_id| integer   | null: false |
| Burden of shipping charges_id   | integer    | null: false|
| Delivery area_id        | integer | null: false |
| Days to ship staring_id | integer| null: false |
| price                | integer | null: false |

### Association

 - belongs_to :user
 - has_one :Purchase management
 - has_one :address
 

 ## address テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| shipping address | string | null: false |
| post_code        | integer| null: false |
| prefectures      | string | null: false |
| municipality     | string | null: false |
| house_number     | string | null: false |
| building_name    | string |
| telephone number | integer| null: false |

### Association

  - belongs_to :user
  - belongs_to :item



 ## Purchase management テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association

 - belongs_to :user

