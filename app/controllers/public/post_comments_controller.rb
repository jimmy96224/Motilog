class Public::PostCommentsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    diary = Diary.find(params[:diary_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.diary_id = diary.id
    comment.save
    redirect_to user_diary_path(user_id: params[:user_id], id: params[:diary_id])
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to user_diary_path(user_id: params[:user_id], id: params[:diary_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
