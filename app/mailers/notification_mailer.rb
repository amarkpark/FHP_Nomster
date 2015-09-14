class NotificationMailer < ActionMailer::Base
  default from: "noreply@ampnomsterapp.com"

  def comment_added(comment)
  	@place = comment.place
  	@place_owner = @place.user

  	mail(to: @place_owner.email, subject: "Comment added to #{@place.name}")
  end
end
