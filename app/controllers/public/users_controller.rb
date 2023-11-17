class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @instrument = @user.instruments.all
    @diaries = @user.diaries.all
    @current_user = current_user
    @diaries = @diaries.tagged_with(params[:tag_name]) if params[:filtered_by_tag]
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  
  def cancel
    @user = current_user
  end

  def close
    if @user.update(is_active: false)
      flash[:success] = "退会処理が完了しました。"
      reset_session
      redirect_to root_path
    else
      flash.now[:danger] = "退会処理に失敗しました。"
      render :show
    end
  end


  private
   def user_params
      params.require(:user).permit(:name, :profile, :goal, :profile_image)
   end

end