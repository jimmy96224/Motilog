class Admin::DiariesController < ApplicationController

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
  end

end
