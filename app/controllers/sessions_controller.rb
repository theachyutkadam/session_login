class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if user.is_active
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logged in!"
      else
        flash.now[:alert] = "Your Account Not Activeted Yet."
        render "new"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
