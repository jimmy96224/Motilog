class Public::DiariesController < ApplicationController
  def new
    @diary = Diary.new
  end

  def create
      @diary = Diary.new(diary_params)
      @diary.user_id=current_user.id
      @diary.instrument = Instrument.find(params[:diary][:instrument])
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
    @diary = Diary.find(params[:id])
    # @diary_comment=DiaryComment.new
    @diary_tags = @diary.tags
  end

  def edit
    @diary = Diary.find(params[:id])
    # pluckはmapと同じ意味です！！
    @tag_list=@diary.tags.pluck(:name).join(',')
  end

  def update
    @diary = Diary.find(params[:id])
    tag_list=params[:diary][:name].split(',')
    if @diary.update(diary_params)
       @diary.save_tag(tag_list)
       redirect_to user_path(current_user),notice:'投稿完了しました'
    else
      render:edit
    end
  end

  def destroy

  end

  private

  def diary_params
    params.require(:diary).permit(:user_id, :instrument_id, :date, :title, :text, :diary_images)
  end

end
