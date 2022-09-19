class RecommendationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_appointment

  def new
    @recommendation = @appointment.build_recommendation
  end

  def create
    @recommendation = @appointment.build_recommendation(recommendation_params)

    if @recommendation.save
      redirect_to @recommendation.appointment, notice: "Recommendation Created!"
    else
      flash.now[:error] = "Not saved! #{@recommendation.errors.full_messages.join(", ")}"
      render "new"
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def recommendation_params
    params.require(:recommendation).permit(:diagnosis, :instruction)
  end
end