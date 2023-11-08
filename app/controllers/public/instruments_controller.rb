class Public::InstrumentsController < ApplicationController
  def new
    @instrument = Instrument.new
  end

  def create
      @user = User.find(params[:user_id])
      @instrument = Instrument.new
    if @instrument.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_path(current_user)
    else
      flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
    @instrument = Instrument.find(params[:id], user_id: params[:user_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def instrument_params
      params.require(:instrument).permit(:name, :profile, :instrument_image, :user_id)
    end

end





