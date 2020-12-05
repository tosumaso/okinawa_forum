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
    respond_to do |format|
    if @room.save
      format.js {render template: "posts/index.js.erb"}
    else
      format.js {render 'create'}
    end
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
