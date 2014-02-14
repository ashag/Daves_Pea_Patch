class DefaultUsertoolStatusToOut < ActiveRecord::Migration
  def change
    change_column :user_tools, :status, :string, default: 'out'
  end
end
