class Public::InstrumentsController < ApplicationController
  def new
    @instrument = Instrument.new
  end

 def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_path(current)
    else
     flash.now[:notice] = "投稿に失敗しました。"
      render :new
    end
 end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def instrument_params
      params.require(:instrument).permit(:name, :profile, :instrument_image)
    end

end





