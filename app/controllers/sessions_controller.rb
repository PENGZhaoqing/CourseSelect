class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
      flash= {:info => "欢迎回来: #{user.name} :)"}
    else
      flash= {:danger => '账号或密码错误'}
    end
    if user.first == false
      render "users/edit"
    else
      redirect_to root_url, :flash => flash
    end

  end

  def new
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
