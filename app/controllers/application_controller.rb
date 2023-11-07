class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      user_path
    else
      user_path(current_user)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end


  protected

    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up,
            keys: [:name, :email, :password, :password_confirmation])

            devise_parameter_sanitizer.permit(:account_update,
            keys: [:name, :profile, :goal, :email, :password, :password_confirmation])

            devise_parameter_sanitizer.permit(:sign_in,keys:[:email])
        end
    end
  
end
