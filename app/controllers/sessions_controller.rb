class SessionsController < ApplicationController

  def new
  	skip_if_logged_in
    @user = User.new
  end

  def create
		if @user = User.find_by(email: params[:email])
     if @user.authenticate(params[:password]) # check if password is correct
       session[:user_id] = @user.id
       flash[:success] = "Login success"
       redirect_to root_path
     else
			flash[:error] = "Error: Password or Email incorect"
			redirect_to root_path
     end
   else
		flash[:error] = "Error: Password or Email incorect"
		redirect_to root_path
   end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "LogOut success"
		redirect_to root_path
	end

	def callback
    if user = User.from_omniauth(env["omniauth.auth"])
       session[:user_id] = user.id
       flash[:success] = "Login success"
       redirect_to root_path
    else
			flash[:error] = "Login error"
			redirect_to root_path
    end
  end

	# private

	# def user_params
	# 	params.require(:user).permit(:email, :password)
	# end
end