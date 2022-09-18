class AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def create
    @appointment = current_user.appointments.build
    @appointment.doctor_id = params[:doctor_id]

    if @appointment.save
      redirect_to appointment_path(@appointment)
    else
      redirect_to root_path
    end
  end
end
