class User < ActiveRecord::Base

  before_save :downcase_email
  attr_accessor :remember_token, :activation_token,:reset_token #添加账户激活相关的代码GREEN
                                                                #添加密码重置相关的代码GREEN
  before_create :create_activation_digest
  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  has_many :grades
  has_many :courses, through: :grades

  has_many :teaching_courses, class_name: "Course", foreign_key: :teacher_id

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}

  #1. The ability to save a securely hashed password_digest attribute to the database
  #2. A pair of virtual attributes (password and password_confirmation), including presence validations upon object creation and a validation requiring that they match
  #3. An authenticate method that returns the user when the password is correct (and false otherwise)
  
  has_secure_password
  #user.authenticate  自带的
  
  # has_secure_password automatically adds an authenticate method to the corresponding model objects.
  # This method determines if a given password is valid for a particular user by computing its digest and comparing the result to password_digest in the database.

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #返回一个随机令牌
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def user_remember                        #存下用户唯一编码
    self.remember_token = User.new_token   #产生随机安全数
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def user_forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if the given token matches the digest.
  def user_authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  #账户激活
  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  #发送账户激活邮件
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  #发送密码重置的相关属性
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  #发送密码重置邮件
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  #如果密码重设超时失效了，返回为true，设为两个小时
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  private

  def downcase_email
    self.email = email.downcase
  end
  
  #创建并且赋值，激活令牌和摘要
  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
  
end
