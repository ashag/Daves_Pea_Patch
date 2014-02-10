class User < ActiveRecord::Base
  has_many  :user_tools
  has_many  :tools, through: :user_tools

end
