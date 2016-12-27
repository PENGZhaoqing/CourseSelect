module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  def student_logged_in?
    !current_user.nil? && !current_user.teacher && !current_user.admin
  end

  def teacher_logged_in?
    !current_user.nil? && current_user.teacher
  end

  def admin_logged_in?
    !current_user.nil? &&current_user.admin
  end

  # 点击log_out,安全退出.只关闭浏览器时会保存cookie,安全退出后就没有了
  def log_out
    forget_user(current_user)
    session.delete(:user_id)
    @current_visit = nil
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if session[:user_id]
      @current_user||= User.find_by(id: session[:user_id]) #存在但是没有赋值时赋值
    elsif cookies.signed[:user_id] #读取值
      user = User.find_by(id: cookies.signed[:user_id])
      if user && user.user_authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def remember_user(user)
    user.user_remember
    # Because it places the id as plain text, this method exposes the form of the application’s cookies
    # and makes it easier for an attacker to compromise user accounts. To avoid this problem,
    # we’ll use a signed cookie, which securely encrypts the cookie before placing it on the browser:
    cookies.signed[:user_id] = {value: user.id, expires: 5.minutes.from_now.utc}
    cookies[:remember_token] = {value: user.remember_token, expires: 5.minutes.from_now.utc}
  end

  def forget_user(user)
    user.user_forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end
  
  #重定向到默认的地址，或者存储的地址
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
  
  #存储以后需要获取的地址
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
 
end
