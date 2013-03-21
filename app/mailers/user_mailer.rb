class UserMailer < ActionMailer::Base
  default :from => "info@dunzoapp.com"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
  end
end
