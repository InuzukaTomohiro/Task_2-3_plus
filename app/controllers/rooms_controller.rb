class RoomsController < ApplicationController
before_action :authenticate_user!

def create
   @room = Room.create
   @joinCurrentUser = Contact.create(user_id: current_user.id, room_id: @room.id)
   @joinUser = Contact.create(join_room_params)
   redirect_to room_path(@room.id)
end

 def show
   @room = Room.find(params[:id])
   if Contact.where(user_id: current_user.id, room_id: @room.id).present?
     @messages = @room.chats
     @message = Chat.new
     @RoomUsers = @room.contacts
   else
     redirect_back(fallback_location: root_path)
   end
 end

 private

 def join_room_params
   params.require(:contact).permit(:user_id, :room_id).merge(room_id: @room.id)
 end

end