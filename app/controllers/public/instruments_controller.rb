class Public::InstrumentsController < ApplicationController
  def new
    @instrument = Instrument.new
  end

  def create
      @instrument = Instrument.new(instrument_params)

    if @instrument.save

      flash[:notice] = "投稿に成功しました。"
      redirect_to user_path(current_user)
    else

      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @user = current_user
    @instrument = Instrument.find(params[:id])

    @logs = @instrument.logs.all
  end

  def edit
    @instrument = Instrument.find_by(id: params[:id], user_id: params[:user_id])
  end

  def update
    @instrument = Instrument.find_by(id: params[:id], user_id: params[:user_id])
    if @instrument.update(instrument_params)
      redirect_to user_instrument_path(user_id: @instrument.user_id, id: @instrument.id), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
  end

  private
    def instrument_params
      # params.require(:instrument).permit(:name, :profile, :instrument_image).merge(user_id: params[:user_id])
      params[:instrument][:user_id] = current_user.id
      params.require(:instrument).permit(:name, :profile, :instrument_image, :user_id)
    end

end





