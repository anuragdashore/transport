class UserMailer < ApplicationMailer
	default from: 'KalpvrikshaTransport@gmail.com'

  def welcome_email(id)
    @user = User.find(id)
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Kalpvriksha Transportation')
  end
end
