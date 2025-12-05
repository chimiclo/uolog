class ProfilesController < ApplicationController
  before_action :set_profile

  def show
    @profile = current_user.profile || current_user.create_profile!
  end

  def edit
    @profile ||= current_user.create_profile!
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profile || current_user.create_profile!
  end

  def profile_params
    params.require(:profile).permit(:name, :style, :area, :comment, :bio, :avatar)
  end
end
