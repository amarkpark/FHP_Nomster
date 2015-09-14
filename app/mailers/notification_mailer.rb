class NotificationMailer < ActionMailer::Base
  default from: "noreply@ampnomsterapp.com"

  def comment_added
  	mail(to: "amarkpark@gmail.com", subject: 'testing comment notification')
  end
end
