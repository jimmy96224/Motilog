class Public::LogsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def create
      @log = Log.new(log_params)
      instrument = Instrument.find(params[:instrument_id])
      @log.instrument = instrument
      @log.user_id = current_user.id
    if @log.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id])
    else
      @instrument = Instrument.find(params[:instrument_id])
      @logs = @instrument.logs.all
      flash.now[:notice] = "投稿に失敗しました。"
      render "public/instruments/show"
    end
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    @log.instrument_id = params[:instrument_id]
    if @log.update(log_params)
      redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id]), notice: "アップデートに成功しました"
    else
      render "edit"
    end
  end

  def destroy
    log = Log.find(params[:id])
    log.destroy
    redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id]), notice: "ログの削除に成功しました"
  end

  def index
    @user = current_user
    @logs = @user.logs.all
  end

  private
  
  def log_params
    params.require(:log).permit(:date, :log, :instrument_id, :user_id)
  end
    
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

end
