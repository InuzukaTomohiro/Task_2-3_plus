class Room < ApplicationRecord

  has_many :users, through: :contacts, dependent: :destroy
  has_many :chats, dependent: :destroy

end
