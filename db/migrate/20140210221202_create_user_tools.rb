class CreateUserTools < ActiveRecord::Migration
  def change
    create_table :user_tools do |t|
      t.integer :user_id
      t.integer :tool_id
      t.integer :qty

      t.timestamps
    end
  end
end
