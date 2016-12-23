class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
        flash= {:info => "欢迎回来: #{user.name}"}
        if admin_logged_in?
          redirect_to rails_admin_path, :flash =>flash
        else
          redirect_to courses_path, :flash => flash
        end
      else
        message = "账户还没激活. "
        message += "请检查您的邮箱并激活账户."
        flash[:warning] = message
        redirect_to root_url
      end
    else  #密码或账户不对
      flash= {:danger => '账号或密码错误'}
      redirect_to sessions_login_path, :flash => flash 
    end
  end

  def new
  end

  def sendmail  
    TestMailer.sendmail.deliver
  end 
  

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
