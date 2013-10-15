require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessible :email, :password
  validates :email, :presence => true, :uniqueness => true
  validates :password_digest, :presence => { :message => "Password can't be blank"}
  
  def set_activation_token!
    self.activation_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
  end
  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end
end
