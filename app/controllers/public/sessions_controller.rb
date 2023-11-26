class Public::SessionsController < Devise::SessionsController

before_action :user_state, only: [:create]

protected
# 　ログイン時の会員ステータス確認
  def user_state
    @user = User.find_by(email: params[:user][:email])
    if @user
        if @user.valid_password?(params[:user][:password]) && !@user.is_active
          redirect_to root_path
        end
    end
  end
end
