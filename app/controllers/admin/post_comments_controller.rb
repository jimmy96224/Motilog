class Admin::PostCommentsController < ApplicationController

  def index
    @post_comments = PostComment.all
  end

  def destroy
    @post_comment = PostComment.find(params[:id])

    if @post_comment.destroy
      flash[:success] = 'Comment successfully deleted.'
    else
      flash[:error] = 'Failed to delete comment.'
    end

    redirect_to admin_diary_path(id: @post_comment.diary_id)
  end

end
