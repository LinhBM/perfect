class Admin::FeedbacksController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def destroy
    @feedback.destroy
    flash[:success] = t "fb_destroy_success"
    redirect_to admin_feedbacks_url
  end
end
