class Public::SessionsController < Devise::SessionsController

before_action :user_state, only: [:create]

protected

  def user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    if @user
    ## 【処理内容2】【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
        if @user.valid_password?(params[:user][:password]) && !@user.is_active
          redirect_to root_path
        end
    end
  end
end
