class MessagesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(params_message)
    if @message.save
      ActionCable.server.broadcast 'message_channel', text: @message
    end
  end

  private
  
  def params_message
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
