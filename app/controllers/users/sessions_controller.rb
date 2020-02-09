# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  def new
    #super
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
    #super finish
    #rediret_to user_path(self.resource.id) #user/show
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end
  def destroy
    #super ソース元:https://rubydoc.info/github/plataformatec/devise/Devise/SessionsController
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given? #引数にブロックがあれば(if block_given?)、ブロックを実行(yield)
    respond_to_on_destroy
    #super finish
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
