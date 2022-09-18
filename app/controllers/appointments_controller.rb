class AppointmentsController < ApplicationController
  load_and_authorize_resource
  def index
    @appointments = current_user.appointments
  end

  def show; end

  def create
    @appointment = current_user.appointments.build
    @appointment.doctor_id = params[:doctor_id]

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to authenticated_root_path
    end
  end
end
