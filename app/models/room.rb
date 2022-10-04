class Room < ApplicationRecord

 has_many :contacts
 has_many :users, through: :contacts
 has_many :chats

end
