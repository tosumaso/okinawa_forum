class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(params_message)
    if @message.save
      ja_time = l @message.created_at
      ActionCable.server.broadcast 'message_channel', text: @message, user: @message.user.nickname, time: ja_time
    end
  end

  private
  
  def params_message
    params.require(:message).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
