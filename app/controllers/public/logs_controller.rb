class Public::LogsController < ApplicationController
  def new
    @log = Log.new
  end

  def create
      @log = Log.new(log_params)
      instrument = Instrument.find(params[:instrument_id])
      @log.instrument = instrument
      @log.user_id = current_user.id
    if @log.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id])
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    @log.instrument_id = params[:instrument_id]
    if @log.update(log_params)
      redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id]), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

    def destroy
      log = Log.find(params[:id])
      log.destroy
      redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id]), notice: "You have deleted a log successfully."
    end



    def index
      # @user = current_user
      @logs = Log.all
    end


  private
    def log_params
      params.require(:log).permit(:date, :log, :instrument_id, :user_id)
    end

end
