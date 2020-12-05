class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :search]

  def index
    @posts =Post.all.order(id: "DESC")
  end

  def new
    @post =Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
    if @post.save
      format.js {render :index}
    else
      format.js {render 'create'}
    end
  end
  end

  def show
    @post = Post.find(params[:id])
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:name, :content).merge(user_id: current_user.id)
  end
end
