class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.all
    @instrument = @user.instruments.all
  end

end
