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
has_many :purchases



## items テーブル

| Column               | Type       | Options                        |
| -------------------- | -------    | -----------                    |；
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_fee_id      | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_time_id     | integer    | null: false                    |

belongs_to :user
has_one :purchase



## shipping_addresses テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| postal_code      | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| address          | string     | null: false |
| building_name    | string     | ----------- |
| purchase         | references | null: false, foreign_key: true |
| tel              | string     | null: false |

belongs_to :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

belongs_to :user
has_one :shipping_address
belongs_to :item
===
