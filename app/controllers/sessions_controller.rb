class SessionsController < ApplicationController

  def new
  end

  def create
    if user = user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your login information"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @_current_user = nil
    # flash[:success] = "You have successfully logged out"
    redirect_to login_path, success: "You have successfully logged out"
  end

end
