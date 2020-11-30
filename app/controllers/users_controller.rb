class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :correct_user!, only: [:edit]
  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

  def correct_user!
    unless current_user.id == User.find(params[:id]).id
      redirect_to root_path
    end
  end

end
