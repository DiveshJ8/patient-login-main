class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      case user.user_type
      when "staff" then redirect_to "http://clinicmanagement-dev.us-east-2.elasticbeanstalk.com", notice: "Logged in successfully"
      when "patient" then redirect_to "https://patient-kiosk.herokuapp.com/userconsent", notice: "Logged in successfully"
      when "nurse" then redirect_to "https://pmp-backend-angular.herokuapp.com/nurse?nurseId=#{user.id}", notice: "Logged in successfully"
      when "manager" then redirect_to "https://pmp-backend-angular.herokuapp.com/manager?managerId=#{user.id}", notice: "Logged in successfully"
      end
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end

#?patientId=#{@user.id}

