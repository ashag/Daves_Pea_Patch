class DefaultAdminStatusAndUserToolStatusAndToolAvatar < ActiveRecord::Migration
  def change
    change_column :users, :admin, :boolean, default: false

    add_column    :user_tools, :status, :string, default: 'in'

    add_column    :tools, :image, :string
  end
end
