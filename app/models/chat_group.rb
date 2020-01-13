class ChatGroup < ApplicationRecord
  has_many :user_groups
  has_many :users, through: :user_groups
  has_many :messages
end
