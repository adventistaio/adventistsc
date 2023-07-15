class PasswordsController < ApplicationController
  before_action :set_user

  def edit
  end

  def update
    if !@user.authenticate(params[:current_password])
      redirect_to edit_password_path, alert: I18n.t('.incorrect_password')
    elsif @user.update(user_params)
      redirect_to profiles_path, notice: I18n.t('.success_change_password')
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
