class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    post_params
    @room = @post.room
    @message = Message.new
    @messages = Message.all
  end

  def new
    @room = Room.new
    post_params
  end

  def create
    post_params
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

  def post_params
    @post = Post.find(params[:post_id])
  end
end
