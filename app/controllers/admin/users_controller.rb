class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if params[:tag_name].present?
      @diaries = @user.diaries.tagged_with(params[:tag_name]).order(date: :asc)
    else
      @diaries = @user.diaries.all.order(date: :asc)
    end
    @instruments = @user.instruments.all
    @score_data = @diaries.pluck(:date, :score)
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "会員情報がアップデートされました"
      redirect_to admin_users_path(@user)
    else
      flash.now[:danger] = "会員情報のアップデートができませんでした"
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:is_active)
  end

end
