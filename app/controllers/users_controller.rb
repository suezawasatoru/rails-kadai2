class UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(params.require(:user).permit(:username, :avatar, :profile))
      flash[:notice] = "プロフィールの更新をしました"
      redirect_to users_profile_path
    else
      render "edit"
    end
  end
  
end
