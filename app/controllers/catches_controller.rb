class CatchesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_catch, only: [:show, :edit, :update, :destroy]
  before_action :authorize_catch!, only: [:edit, :update, :destroy]

  def new
    @catch = Catch.new
  end

  def create
    @catch = current_user.catches.build(catch_params.except(:remove_image_ids))

    if @catch.save
      attach_new_images(@catch)
      redirect_to @catch, notice: "釣果を登録しました！"
    else
      flash.now[:alert] = "入力内容を確認してください。"
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @catches = Catch.order(created_at: :desc).page(params[:page]).per(9)
    if !user_signed_in? && params[:page].present? && params[:page].to_i > 1
      redirect_to new_user_session_path, alert: "続きの釣果を見るにはログインが必要です。"
    end
  end

  def show
  end

  def edit
  end

  def update
    if params[:catch][:remove_image_ids].present?
      params[:catch][:remove_image_ids].each do |image_id|
        @catch.images.find(image_id).purge
      end
    end

    attrs        = catch_params.dup
    new_images   = attrs.delete(:images)
    attrs.delete(:remove_image_ids)

    if @catch.update(attrs)
      if new_images.present?
        new_images.each do |img|
          @catch.images.attach(img)
        end
      end

      redirect_to @catch, notice: "釣果を更新しました！"
    else
      flash.now[:alert] = "入力内容を確認してください。"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @catch.user == current_user
      @catch.destroy
      redirect_to catches_path, notice: "釣果を削除しました"
    else
      redirect_to catch_path(@catch), alert: "この釣果を削除する権限がありません"
    end
  end

  private

  def set_catch
    @catch = Catch.find(params[:id])
  end

  def authorize_catch!
    if @catch.user_id != current_user.id
      redirect_to catches_path, alert: "あなたの釣果以外は編集できません。"
    end
  end

  def catch_params
    params.require(:catch).permit(
      :caught_on, :fish_name, :size, :location,
      :condition, :tackle, :memo,
      :latitude, :longitude,
      { images: [] },
      { remove_image_ids: [] }
    )
  end

  def attach_new_images(catch)
    imgs = catch_params[:images]
    return if imgs.blank?

    imgs.each do |img|
      catch.images.attach(img)
    end
  end
end
