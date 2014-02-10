class UserTool < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :tool
end
