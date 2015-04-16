class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(params[:email],
                                     params[:password])

    if @user
      login!(@user)
      redirect_to @user
    else
      flash[:error] = "Incorrect email/password"
      redirect_to new_session_url
    end
  end

  def destroy
    @user = User.find_by(session_token: session[:session_token])
    @user.reset_session_token!
    session[:session_token] = nil
    redirect_to @user
  end

end
