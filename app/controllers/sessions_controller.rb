# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(destination_way_home_if_cookies_nil)
    else
      flash.now[:alert] = 'Login and password required'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You are logged out'
    redirect_to login_path
  end

  def destination_way_home_if_cookies_nil
    cookies.delete(:desired_url) || tests_path
  end
end
