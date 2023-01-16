class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, if: :admin_url
  before_action :configure_permitted_parameters, if: :devise_controller?

  def admin_url
    request.fullpath.include?("/admin")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end


  def after_sign_in_path_for(resource)
    case resource
    when User
      root_path
    when Admin
      admin_top_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :user
      root_path
    when :admin
      new_admin_session_path
    end
  end

end
