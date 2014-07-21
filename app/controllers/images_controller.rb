class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
      if @image.save
       @image.post_image(current_user.facebook_token,@image.attachment.url,@image.title,@image.description,"Image post to wall")
        redirect_to '/'     
      else
       render action: "new"     
      end   
    end 
    
end
