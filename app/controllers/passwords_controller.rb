class PasswordsController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if !@user.authenticate(params[:current_password])
      redirect_to edit_password_path, alert: 'La contraseña actual es incorrecta'
    elsif @user.update(user_params)
      redirect_to profiles_path, notice: 'Tu contraseña fue cambiada correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = Current.user
    end

    def user_params
      params.permit(:password, :password_confirmation)
    end
end
