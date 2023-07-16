# frozen_string_literal: true

class SettingsController < ApplicationController
  def index
    @available_locales = I18n.available_locales
    @locale = Current.user.locale
  end

  def update
    user = Current.user
    user.settings = settings_params
    user.save

    redirect_to settings_url, notice: t('.updated_success')
  end

  private

  def settings_params
    params.require(:settings).permit(:locale)
  end
end