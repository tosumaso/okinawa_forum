class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :correct_user!, only: [:edit]
  def edit
    user_find
  end

  def update
    user_find
    respond_to do |format|
    if @user.update(user_params)
      format.js {render template: "posts/index.js.erb"}
    else
      format.js {render "update"}
    end
    end
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  def correct_user!
    unless current_user.id == User.find(params[:id]).id
      redirect_to root_path
    end
  end

end
