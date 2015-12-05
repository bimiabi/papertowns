class CommentMailer < ActionMailer::Base

  def comment_created(current_user,appointment_user,content, status)

    @current_user = current_user
    @appointment_user = appointment_user
    @content = content
    @status = status
    if status == "Pending"
    mail(to: appointment_user.email,
         from: "airdbapp@gmail.com", #using Gmail smtp settings it will override this "from:" so it doesnt matter what we put here
         subject: "Comment Created",
    )
    end
  end

end
