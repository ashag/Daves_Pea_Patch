class AddTimeColumnToEvent < ActiveRecord::Migration
  def change
    add_column  :events, :time, :time
  end
end
