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
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|
|email|string|null: false,unique: true|

### Association
has_many :user_groups
has_many :user_groups, through :user
has_many :messages


## chat-groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|


### Association
has_many :user_groups
has_many :users, through: :user_groups
has_many :messages

## user_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|chat_group_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :chat_group

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|image|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|chat_group_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :chat_group