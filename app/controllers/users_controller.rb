class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if user.save
      UserMailer.welcome_email(@user, @user).deliver_now # put NOW instead of LATER for instant email
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end
end