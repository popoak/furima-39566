# README

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
| ------------------ | ------     | ----------- |
| name               | string     | null: false |
| email              | string     | null: false |
| password           | string     | null: false |
| name(全角)          | string     | null: false |
| name(furigana)     | string     | null: false |
| date of birt       | references | null: false |



## items テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| Seller               | string | null: false |
| Category             | string | null: false |
| item condition       | string | null: false |
| Shipping cost        | string | null: false |
| Shipping origin      | string | null: false |
| Estimated shipping   | string | null: false | 




## Shipping address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name(buyer)id    | references | null: false |
| address          | references | null: false |
| tel              | references | null: false |

## Purchase record テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| purchased item | references | ------------------------------ |
| ongoing item   | references | ------------------------------ |
