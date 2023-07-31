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

| Column             | Type       | Options                  |
| ------------------ | ------     | ------------------------ |
| nickname           | string     | null: false              |
| email              | string     | null: false,unique: true |
| encrypted_password | string     | null: false              |
| last_name          | string     | null: false              |
| family_name        | string     | null: false              |
| last_name_kana     | string     | null: false              |
| family_name_kana   | string     | null: false              |
| birthday           | date       | null: false              |

has_many :items
has_many :purchase_records
=


## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |；
| item_name            | string  | null: false |
| item_description     | text    | null: false |
| item_price           | integer | null: false |
| seller_id            | integer | null: false |
| category_id          | integer | null: false |
| item_Condition       | string  | null: false |
| shipping_fee         | integer | null: false |
| shipping_origin      | string  | null: false |
| delivery_time        | integer | null: false |

belongs_to :user




## shipping_address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | references | null: false |
| prefecture       | references | null: false |
| city             | references | null: false |
| address          | references | null: false |
| Building_name    | references | null: false |
| tel              | integer    | null: false |

has_many :purchase_records

## purchase_records テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | -------------------------------|
| purchased_item | references | ------------------------------ |
| ongoing_item   | references | ------------------------------ |

belongs_to :user
belongs_to :shipping_address
