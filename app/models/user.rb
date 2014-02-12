class User < ActiveRecord::Base
  has_many  :user_tools
  has_many  :tools, through: :user_tools
  has_many  :posts, through: :user_posts

end
