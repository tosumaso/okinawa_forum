class RoomsController < ApplicationController
  def index
    @post =Post.find(params[:post_id])
    @room = @post.room
    @message = Message.new
    @messages = Message.all
  end

  def new
    @room = Room.new
    @post = Post.find(params[:post_id])
  end

  def create
    @room = Room.new(params_room)
    if @room.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def params_room
    params.require(:room).permit(:name).merge(post_id: params[:post_id])
  end
end
