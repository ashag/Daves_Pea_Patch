class Tool < ActiveRecord::Base
  has_many    :user_tools
  has_many    :users, through: :user_tools

end
