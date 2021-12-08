class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && @user.user_type == "staff"
    	session[:user_id] = @user.id
      case @user.user_type
      when "staff" then redirect_to "http://clinicmanagement-dev.us-east-2.elasticbeanstalk.com/", notice: "Successfully created account"
      when "patient" then redirect_to "https://patient-kiosk.herokuapp.com/userdetails", notice: "Successfully created account"
      when "doctor" then redirect_to "", notice: "Successfully created account"
      when default then redirect_to root_path, notice: "Successfully created account"
      end 
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end
end
