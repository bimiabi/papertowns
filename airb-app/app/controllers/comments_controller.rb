class CommentsController < ApplicationController

def create
    @appointment = Appointment.find(params[:appointment_id])
      @comment = @appointment.comments.create(comments_params)
      redirect_to appointment_path(@appointment)
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

end
