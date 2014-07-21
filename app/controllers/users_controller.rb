class UsersController < ApplicationController
before_filter :authenticate_user!, :except=>[:facebook]
	def index
	end
	
	 def facebook
    response_hash= request.env['omniauth.auth'] 
     user = User.find_by_email(response_hash["info"]["email"])
      if user.nil?
        session[:facebook]={:email=>response_hash["info"]["email"], :first_name=>response_hash["info"]["first_name"], :last_name=>response_hash["info"]["last_name"], :image=>response_hash["info"]["image"], :token=>response_hash["credentials"]["token"]}
        flash[:notice] = "Some fields are fetched from facebook. Please fill the form."
        redirect_to new_user_registration_path and return
      else
        user.update_attribute("facebook_token",response_hash["credentials"]["token"])
				 sign_in("user", user)
        after_sign_in_path_for(user)
      end 
		end  
		
	#~ def post_picture
		  #~ @image = Image.new
		#~ end

#~ def post_text
		  #~ @text = Text.new
	#~ end
	
	
end
