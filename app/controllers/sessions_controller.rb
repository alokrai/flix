class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email_or_username]) ||
      User.find_by(username: params[:email_or_username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:intended_url] || root_url, notice: "welcome back #{user.name}"
    else
      flash.now[:alert] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:intended_url] = nil
    redirect_to root_path
  end
end
