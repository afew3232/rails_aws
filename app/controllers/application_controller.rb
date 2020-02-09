class ApplicationController < ActionController::Base


  def after_sign_in_path_for(resource)
  	#ソース元：https://www.rubydoc.info/github/plataformatec/devise/Devise/Controllers/Helpers:after_sign_in_path_for
    #ログイン後、user/:idに飛ぶように設定(そのままだとrootに飛ぶ)
    user_path(resource.id)
  end

end
