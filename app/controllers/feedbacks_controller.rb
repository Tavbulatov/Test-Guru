class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params.merge({ firstname: current_user.name, lastname: current_user.last_name,
                                                     email: current_user.email }))
    if @feedback.save
      FeedbacksMailer.feedback_created(@feedback).deliver_now
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
