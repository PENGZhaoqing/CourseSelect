class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    #  if user.activated?
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember_user(user) : forget_user(user)
        flash= {:info => "欢迎回来: #{user.name}"}
        if admin_logged_in?
          redirect_to rails_admin_path, :flash =>flash
        #管理员不用激活
        else
          redirect_to courses_path, :flash => flash   #激活后跳转路径设置为我的课程
          #redirect_back_or user
        end
     # else
     #   flash= {:warning => '账户还没激活.请检查您的邮箱并激活账户.'}
     #   redirect_to sessions_login_path, :flash => flash  #没有激活还应该停在登录页面
     # end    
     
      else
       flash= {:warning => '账户还没激活.请检查您的邮箱并激活账户.'}
        redirect_to sessions_login_path, :flash => flash  #没有激活还应该停在登录页面
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
    log_out if logged_in?   #md这是什么写法
    redirect_to root_url
  end

end
