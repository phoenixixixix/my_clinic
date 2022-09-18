class RecommendationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment

  def new
    @recommendation = @appointment.build_recommendation
  end

  def create
    @recommendation = @appointment.build_recommendation(recommendation_params)

    if @recommendation.save
      redirect_to @recommendation.appointment
    else
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