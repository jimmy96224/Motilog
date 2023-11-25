class Admin::DiariesController < ApplicationController
  
  before_action :authenticate_admin!

  def index
    @diaries = if params[:search]
      Diary.where("title LIKE ?", "%#{params[:search]}%")
    else
      Diary.all
    end
  end

  def show
    @diary = Diary.find(params[:id])
    @user = @diary.user
    @instrument = @user.instruments.all
  end

end
