class UserMailer < ApplicationMailer
	def submit_email(user)
	    @user = user
	    # @url  = 'http://example.com/login'
	    mail(to: @user.email, subject: 'Formulir Berhasil Dikirim')
	  end
end
