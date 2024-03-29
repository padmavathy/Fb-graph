class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource)
    if current_admin
        redirect_to "/admins"
        else
          redirect_to "/"
      end
    end
end
