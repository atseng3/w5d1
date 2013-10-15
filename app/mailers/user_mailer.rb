class UserMailer < ActionMailer::Base
  default from: "notification@musicapp.com"
  
  def welcome_email(user)
    @user = user
    @user.set_activation_token!
    activation_token = @user.activation_token
    @activation_url = "/?activation_token=#{activation_token}"
    mail(to: user.email, subject: 'Welcome to Music App!!')
  end
end
