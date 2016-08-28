module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !current_user.nil?
  end

  # 点击log_out,安全退出.只关闭浏览器时会保存cookie,安全退出后就没有了
  def log_out
    forget_user(current_user)
    session.delete(:user_id)
    @current_visit = nil
  end

  def admin?(user)
    if user.nil?
      return false
    else
      user.admin
    end
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    if session[:user_id]
      @current_user||= User.find_by(id: session[:user_id])
    elsif cookies.signed[:user_id]
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
    cookies.signed[:user_id] = {value: user.id, expires: 1.years.from_now.utc}
    cookies[:remember_token] = {value: user.remember_token, expires: 1.years.from_now.utc}
  end

  def forget_user(user)
    user.user_forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user?(user)
    user == current_user
  end


  def login_visit(mappingdb)
    session[:visit_id]=mappingdb.id
  end

  def current_visit
    if session[:visit_id]
      @current_visit||= MappingDb.find_by(id: session[:visit_id])
    end
  end

  def log_out_visit
    session.delete(:visit_id)
    @current_visit = nil
  end

  def logged_in_visit?
    !current_visit.nil?
  end





end
