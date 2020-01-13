class User < ApplicationRecord
  has_many :user_groups
  has_many :user_groups, through :user
  has_many :messages
end
