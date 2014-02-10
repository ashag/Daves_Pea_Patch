class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string  :name
      t.integer :qty

      t.timestamps
    end
  end
end
