class Public::MaintenanceLogsController < ApplicationController
  def new
    @maintenance_log = MaintenanceLog.new
  end

  def create
      @maintenance_log = MaintenanceLog.new(maintenance_log_params)
      # @maintenance_log = current_user.maintenance_logs.build(maintenance_log_params)
      @maintenance_log.loggable_type = loggable_obj.class.name
      @maintenance_log.loggable_id = loggable_obj.id
    if @maintenance_log.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_instrument_path(user_id: current_user.id, id: params[:instrument_id])
    else

      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def index
  end


  private
    def maintenance_log_params
      params.require(:maintenance_log).permit(:date, :log, :instrument_id)
    end

end
