class Public::UsersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user, except: [:show]
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
    @instruments = @user.instruments.all
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
      redirect_to user_path(current_user), notice: "アップデートに成功しました"
    else
      render "edit"
    end
  end
  
  def cancel
    @user = current_user
  end

  def close
    @user = current_user
    if @user.update(is_active: false)
      flash[:success] = "退会処理が完了しました"
      reset_session
      redirect_to root_path
    else
      flash.now[:danger] = "退会処理に失敗しました"
      render :show
    end
  end

  private
   def user_params
      params.require(:user).permit(:name, :profile, :goal, :profile_image)
   end
   
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end 
   
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end