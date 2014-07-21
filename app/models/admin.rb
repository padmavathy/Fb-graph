class Admin < ActiveRecord::Base
   attr_accessible :email, :password, :password_confirmation
  devise :database_authenticatable, :timeoutable
end
