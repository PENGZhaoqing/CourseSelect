class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]         #获取用户
  before_action :valid_user, only: [:edit, :update]       #是否为有效用户
  before_action :check_expiration, only: [:edit, :update] #检测令牌是否过期
  
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if both_passwords_blank?   #检测特殊情况，密码和确认密码是否都为空
      flash.now[:danger] = "Password/confirmation can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
private
  
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
  #密码和确认密码都为空，则返回true
  def both_passwords_blank?
    params[:user][:password].blank? &&params[:user][:password_confirmation].blank?
  end
  
  #事前过滤器
  
  def get_user
    @user = User.find_by(email: params[:email])
  end
  
  #确保是有效用户
  def valid_user
    unless (@user && @user.activated? &&@user.user_authenticated?(:reset, params[:id]))
    redirect_to root_url
    end
  end
  
  #检测令牌是否过期
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
  end
  
end
