class RegistrationsController < ApplicationController

  def signup
    @user = User.new(registrations_params)

    if @user.save
      login!
      render json: { status: :created, user: @user }
    else
      render json: { status: 500 }
    end
  end

  private
    def registrations_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :introduction)
    end
end