class AccountActivationsController < ApplicationController
    
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.user_authenticated?(:activation, params[:id])
            user.activate
            log_in user
            flash[:success] = "激活成功 ！"
            redirect_to user
        else
            flash[:danger] = "无效的激活链接！"
            redirect_to root_url
        end
    end
end