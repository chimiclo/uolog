class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @profile = @user.profile || @user.create_profile!

    @catches = @user.catches
                    .order(created_at: :desc)
                    .page(params[:page])
                    .per(9)

    @catches_count = @user.catches.count
  end

  def edit
    redirect_to profile_path unless @user == current_user
  end

  def update
    redirect_to profile_path unless @user == current_user

    if @profile.update(profile_params)
      redirect_to profile_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user =
      if params[:user_id]
        User.find(params[:user_id])
      else
        current_user
      end

    @profile = @user.profile || @user.create_profile!
  end

  def profile_params
    params.require(:profile).permit(:name, :style, :area, :comment, :bio, :avatar)
  end
end

