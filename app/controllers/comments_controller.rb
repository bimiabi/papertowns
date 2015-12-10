class CommentsController < ApplicationController


def create
    @appointment = Appointment.find(params[:appointment_id])
      @comment = @appointment.comments.create(comments_params)
      CommentMailer.comment_created(current_user,@appointment.user,@comment.content, @comment.status, @appointment, @appointment.customer_name, @appointment.technician_name, @appointment.appointment_date, @appointment.phone_number, @appointment.address, @appointment.appointment_type).deliver
      redirect_to appointment_path(@appointment)
  end

  private

  def comments_params
    params.require(:comment).permit(:status, :content)
  end

end
