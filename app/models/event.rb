class Event < ActiveRecord::Base
  before_save :convert_date
  validates_presence_of       :title, :date, :time, :location

  def start_time
    self.date
  end

  def convert_date
    self.date.strftime("%m-%d-%Y")
  end

end
