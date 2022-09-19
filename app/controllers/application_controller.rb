class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_path, alert: exception.message
  end
  def after_sign_out_path_for(scope)
    root_path
  end

  def sort_doctors_by_category(doctors, category_title)
    return doctors unless category_title

    category = MedicalSpecialty.find_by(title: category_title)
    doctors.select { |d| d.categories.include?(category) }
  end
end
