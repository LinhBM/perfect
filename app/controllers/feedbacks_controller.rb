class FeedbacksController < ApplicationController
  load_and_authorize_resource

  def index
    @feedback = Feedback.all.newest
  end

  def new
  end

  def create
    @feedback = current_user.feedbacks.build feedback_params
    if @feedback.save
      flash[:success] = t "fb_create_success"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit :id, :subject, :content
  end
end
