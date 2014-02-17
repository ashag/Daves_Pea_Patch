class Event < ActiveRecord::Base

  def start_time
    self.date
  end

end
