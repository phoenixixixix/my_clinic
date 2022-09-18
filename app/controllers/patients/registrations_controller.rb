class Patients::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  def create
    params[:user] = params[:user]&.merge(type: "Patient")
    super
  end

  def after_sign_up_path_for(resource)
    authenticated_root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[id type])
  end
end