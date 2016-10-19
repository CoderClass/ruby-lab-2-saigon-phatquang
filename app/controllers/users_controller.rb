class UsersController < ApplicationController

  def new
  	skip_if_logged_in
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Create user success"
			session[:user_id] = @user.id
			redirect_to users_path
		else
			flash[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
			redirect_to root_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :name)
	end
end