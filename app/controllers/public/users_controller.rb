class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @instrument = @user.instruments.all
    @diaries = Diary.all
    @tag_list=Tag.all
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


  private
   def user_params
      params.require(:user).permit(:name, :profile, :goal, :profile_image)
   end

end
