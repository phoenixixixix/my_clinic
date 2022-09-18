class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def show
    @doctor = Doctor.find(params[:id])
  end

  def index
    @doctors = Doctor.all
  end
end
