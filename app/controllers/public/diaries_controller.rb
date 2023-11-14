class Public::DiariesController < ApplicationController

  def index
    @diaries = Diary.all
    @diaries = @diaries.tagged_with(params[:tag_name]) if params[:filtered_by_tag]
  end

  def new
    @diary = Diary.new
  end

  def create
      @diary = Diary.new(diary_params)
      @diary.user_id=current_user.id
      if params[:diary][:instrument].present?
        @diary.instrument = Instrument.find(params[:diary][:instrument])
      end
      if params[:diary][:diary_image].present?
        @diary.diary_image.attach(params[:diary][:diary_image])
      end

    if @diary.save
      # @diary.save_tag(tag_list)
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @diary = @user.diaries.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @user = User.find(params[:user_id])
    @diary = @user.diaries.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @diary = @user.diaries.find(params[:id])
    if params[:diary][:instrument].present?
      @diary.instrument = Instrument.find(params[:diary][:instrument])
    end
    if @diary.update(diary_params)
       redirect_to user_diary_path(user_id: current_user, id: params[:id]),notice:'投稿完了しました'
    else
      render:edit
    end
  end

  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to user_path(current_user)
  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :instrument_id, :date, :title, :text, :diary_image, :tag_list)
  end

end
