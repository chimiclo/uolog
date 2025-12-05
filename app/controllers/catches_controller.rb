class CatchesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_catch, only: [:show]

  def new
    @catch = Catch.new
  end

  def index
    @catches = Catch.order(created_at: :desc)
  end

  def create
    @catch = current_user.catches.build(catch_params)

    if @catch.save
      redirect_to @catch, notice: "釣果を登録しました！"
    else
      flash.now[:alert] = "入力内容を確認してください。"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def set_catch
    @catch = Catch.find(params[:id])
  end

  def catch_params
    params.require(:catch).permit(
      :caught_on,
      :condition,
      :fish_name,
      :size,
      :location,
      :latitude,
      :longitude,
      :tackle,
      :memo,
      images: []
    )
  end
end
