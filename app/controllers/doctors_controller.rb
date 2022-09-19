class DoctorsController < ApplicationController
  load_and_authorize_resource

  def show; end

  def index
    @doctors = sort_doctors_by_category(Doctor.all, params[:category_title])
    @categories = MedicalSpecialty.all
  end
end
