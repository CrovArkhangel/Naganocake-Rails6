class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
          admin_homes_top_path
      else
          public_root_path
      end
  end

  def
  after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :customer
          root_path
      elsif resource_or_scope == :admin
          new_admin_session_path
      else
          public_root_path
      end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(
      first_name last_name first_name_kana last_name_kana zip_code address telphone_number))
  end
end
