class UserMailer < ActionMailer::Base
  default :from => "jtg028@gmail.com"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => "Invitation Request Received")
  end
end
