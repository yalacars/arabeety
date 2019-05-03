class ExampleMailer < ApplicationMailer


	default from: "riyad.faek@gmail.com"

	def registration_confirmation(user)
	    @user = user
	    mail(:to => "#{user.name} <#{user.email}>", :subject => "3arabeety Registration Confirmation")
 	end

end
