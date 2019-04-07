class UserMailer < ApplicationMailer


	default :from => "riyad.faek@gmail.com"

def registration_confirmation(user)
    @user = user
 mail(:to => "#{user.name} <#{user.email}>", :subject => "3arabeety Registration Confirmation")
 end

def password_reset(user)
    @user = user
    mail to: user.email, subject: "3arabeety Password reset"
  end

end
