class UserMailer < ApplicationMailer
  default from: "noreply@example.com"
  
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  
  #发送账户激活链接
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
   
  #发送密码重置链接
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
end
