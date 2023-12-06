class Admin::DiariesController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:search].present?
      @diaries = Diary.where("title LIKE ?", "%#{params[:search]}%")
    elsif params[:tag_name].present?
      @diaries = Diary.tagged_with(params[:tag_name])
    else
      @diaries = Diary.all
    end
  end

  def show
    @diary = Diary.find(params[:id])
    @user = @diary.user
    @instruments = @user.instruments.all
    @diaries = @user.diaries.all
    @score_data = @diaries.pluck(:date, :score)
  end

end
