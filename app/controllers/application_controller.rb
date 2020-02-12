class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
  	#ソース元：https://www.rubydoc.info/github/plataformatec/devise/Devise/Controllers/Helpers:after_sign_in_path_for
    #ログイン後、user/:idに飛ぶように設定(そのままだとrootに飛ぶ)
    user_path(resource.id)
  end


  before_action :configure_permitted_parameters, if: :devise_controller?  
  
  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
