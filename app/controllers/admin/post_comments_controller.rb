class Admin::PostCommentsController < ApplicationController
  
  before_action :authenticate_admin!

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
      flash[:success] = 'コメントが削除されました'
    else
      flash[:error] = 'コメントの削除に失敗しました'
    end

    redirect_to admin_user_diary_path(user_id: @user.id ,id: @diary.id)
  end

  def post_comment_params
    params.require(:post_comment).permit(:diary_id, :comment, :user_id)
  end

end
