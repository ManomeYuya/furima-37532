# README

## users 　テーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|name              |staring|null: false|
|email             |staring|null: false|
|encrypted_password|staring|null: false|
|nickname          |staring|null: false|
|birthday          |integer|null: false|


### Association

 - has_many :sells
 - has_many :orders
 



 ## items テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| item_name| string    | null: false |
| category | staring   | null: false |
| brand    | staring   | null: false |
| user     | reference | null: false, foreign_key: true |
| price    | integer   | null: false|

### Association

 - has_many :
 - has_one_attached :order
 

 ## orders テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| item     | reference | null: false, foreign_key: true |
| user     |  string  | null: false |
| price    | reference | null: false, foreign_key: true |
| address  |  string    | null: false |

### Association

  - belongs_to :user


 ## sells テーブル

| Column   | Type      | Options     |
| ---------| --------- | ----------- |
| user     | string    | null: false |
| item_name| string    | null: false |
| category | staring   | null: false |
| brand    | staring   | null: false |
| price    | integer   | null: false|

### Association

 - belongs_to :user

