class Public::DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
      @diary = Diary.new(diary_params)
      @diary.user_id=current_user.id
      tag_list=params[:diary][:name].split(',')
    if @diary.save
      @diary.save_tag(tag_list)
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :instrument_id, :title, :text, :diary_images)
  end

end
