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
| last name          | string     | null: false  |
| family name        | string     | null: false  |
| email              | string     | unique: true |
| encrypted_password | string     | null: false  |
| last name_kana     | string     | null: false  |
| family name_kana   | string     | null: false  |
| birthday           | data       | null: false  |



## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |；
| item_name            | string  | null: false |
| item_description     | string  | null: false |
| item_details         | string  | null: false |
| item_price           | integer | null: false |
| seller_id            | integer | null: false |
| category_id          | integer | null: false |
| item_Condition       | string  | null: false |
| shipping_fee         | integer | null: false |
| shipping_origin      | string  | null: false |
| delivery_time        | integer | null: false |




## shipping address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | references | null: false |
| address          | references | null: false |
| card information | references | null: false |
| tel              | integer    | null: false |

## purchase record テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchased_item | references | ------------------------------ |
| ongoing_item   | references | ------------------------------ |
