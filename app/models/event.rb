class Event < ActiveRecord::Base
  before_save :convert_date

  def start_time
    self.date
  end

  def convert_date
    self.date.strftime("%m-%d-%Y")
  end

end
