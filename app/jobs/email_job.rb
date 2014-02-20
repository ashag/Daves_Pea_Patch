class EmailJob

  @queue = :email
  #Resque can only accept simple objects such as inten 
  def self.perform(user_id)
    # ListMailer.join(user_id).deliver
  end
end