Rails.application.config.middleware.use OmniAuth::Builder do
	 require 'omniauth'
	 #~ if Rails.env.development?
		provider :facebook, '601054116592903', 'd173a2be29a0745ce5164212019ba5f6', :scope => "offline_access, email,publish_stream, user_photos, photo_upload,user_birthday"
	#~ end	
	OmniAuth.config.on_failure = Proc.new do |env| 
	 [302, {'Location' => "/login", 'Content-Type'=> 'text/html'}, []]
	end
end

