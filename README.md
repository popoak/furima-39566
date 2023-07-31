~+(–# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | -----------  |
| nickname           | string     | null: false  |
| email              | string     | unique: true |
| encrypted_password | string     | null: false  |
| last_name          | string     | null: false  |
| family_name        | string     | null: false  |
| last name_kana     | string     | null: false  |
| family_name_kana   | string     | null: false  |
| birthday           | date       | null: false  |

has_many :items
has_many :shopping_address
has_many :purchase_record
=


## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |；
| item_name            | string  | null: false |
| item_description     | text    | null: false |
| item_details         | string  | null: false |
| item_price           | integer | null: false |
| seller_id            | integer | null: false |
| category_id          | integer | null: false |
| item_Condition       | string  | null: false |
| shipping_fee         | integer | null: false |
| shipping_origin      | string  | null: false |
| delivery_time        | integer | null: false |

belongs_to :users




## shipping address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| Building_name    | string     | null: false |
| tel              | integer    | null: false |

belongs_to :users

## purchase record テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | -------------------------------|
| purchased_item | string     | ------------------------------ |
| ongoing_item   | string     | ------------------------------ |

belongs_to :users