class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def show
    @user = User.find(params[:user_id])
    @diaries = @user.diaries.all
    @instrument = @user.instruments.all
    @post_comments = @user.post_comments.all
  end

  def destroy
    @user = User.find(params[:user_id])
    @diary = Diary.find(params[:diary_id])
    @post_comment = PostComment.find(params[:id])

    if @post_comment.destroy
      flash[:success] = 'Comment successfully deleted.'
    else
      flash[:error] = 'Failed to delete comment.'
    end

    redirect_to admin_user_diary_path(user_id: @user.id ,id: @diary.id)
  end

  def post_comment_params
    params.require(:post_comment).permit(:diary_id, :comment, :user_id) # 必要な属性に合わせて修正
  end

end
