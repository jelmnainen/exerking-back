class UserMailer < ActionMailer::Base
  default from: "exerking@example.com"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "New Password"
  end
end
