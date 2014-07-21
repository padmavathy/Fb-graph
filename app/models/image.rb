class Image < ActiveRecord::Base
   attr_accessible :title, :description, :attachment
  belongs_to :user
   has_attached_file :attachment, 
  :path => ":rails_root/public/system/:attachment/:id/:style/:normalized_file_name",
	:url => "/system/:attachment/:id/:style/:normalized_file_name", 
  :styles => {
  :thumb => "250x250#",
  :modified=>"500x500#"
  }#, :default_url => "#{RAILS_ROOT}/images/pictureplaceholder.png"
  validates_attachment_content_type :attachment,  :content_type => ['image/jpeg', 'image/png','image/jpg', 'image/gif','image/tiff','image/bmp'] 

  validates_presence_of :title, :message => "Title is required" 
  validates_presence_of :description, :message => "Download type is required" 
  validates_attachment_presence :attachment, :message => "Attachment is required"  
  before_validation :white_space_strip 
   
  # Method for removing white space from the file name(file path)
  Paperclip.interpolates :normalized_file_name do |attachment, style|
    attachment.instance.normalized_file_name
  end
  
  def normalized_file_name
    if !self.attachment_file_name.nil?
      "#{self.attachment_file_name.gsub( /[^a-zA-Z0-9\-_\.]/, '_')}"
    end
  end   
  
  # Method for removing white space from the file name(file name)
  def white_space_strip
    self.attachment_file_name= normalized_file_name
  end
  
  def post_image(token,path,title,desc,message) 
    FbGraph::User.me(token).feed!(:message => message, :picture =>"http://samplefbapp.herokuapp.com/"+path, :name =>title, :description => description)		 
  end
  
end
