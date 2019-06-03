class RegistrationsController < Devise::RegistrationsController
  def show
    @user = User.find params[:id]
  end

  private
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :phone_number, :country_code)
  end

end
