# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[update]

  def index
    @user = Current.user
    @profile = @user.profile
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'Profile updated'
    else
      render :profile
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :biography, :avatar)
  end

  def set_profile
    @profile = Current.user.profile
  end
end
