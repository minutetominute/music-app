class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if password_confirmed? && @user.save!
      login!(@user)
      redirect_to @user
    else
      flash[:error] = "Mistakes have been made"
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def password_confirmed?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
