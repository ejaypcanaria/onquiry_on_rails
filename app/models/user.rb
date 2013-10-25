class User < ActiveRecord::Base
  
  validates :password, length: { minimum: 8 }
  
end
