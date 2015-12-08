class CommentsController < ApplicationController


def create
    @appointment = Appointment.find(params[:appointment_id])
      @comment = @appointment.comments.create(comments_params)
      CommentMailer.comment_created(current_user,@appointment.user,@comment.content, @comment.status).deliver
      redirect_to appointment_path(@appointment)
  end

  private

  def comments_params
    params.require(:comment).permit(:status, :content)
  end

end
