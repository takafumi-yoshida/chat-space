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
has_many :groups, through: :user_groups
has_many :messages


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
has_many :user_groups
has_many :users, through: :user_groups
has_many :messages

## user_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :group

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|
|image|string|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### validation
validates :message_or_image, presence: true

private
  def email_or_phone
    message.presence or image.presence
  end

### Association
belongs_to :user
belongs_to :group