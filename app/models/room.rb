class Room < ApplicationRecord

  has_many :users, through: :contacts, depndent: :destroy
  has_many :chats, dependent: :destroy

end
