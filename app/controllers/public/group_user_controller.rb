class Public::GroupUserController < ApplicationController
  
  before_action :authenticate_user!

  def create
    group = Group.find(params[:group_id])
    current_user.join_group(group)
    redirect_to user_groups_path(user_id: current_user)
  end

  def destroy
    group = Group.find(params[:group_id])
    current_user.leave_group(group)
    redirect_to user_groups_path(user_id: current_user)
  end
  
end
