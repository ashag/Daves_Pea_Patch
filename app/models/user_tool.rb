class UserTool < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :tool

  def return_notification
    email = current_user.email 

    Pony.mail(to: email, from: "adaBugFree13@gmail.com", subject: "Return the #{self.name}", body: self.body)
  end

  def body 
    case self.name
    when "hose"
      "We knows you have our hose"
    when "wheelbarrow"
      "Don't get carried away."
    when "glove"
      "No glove, no love."
    when "lawnmower"
      "Is your mower running? You better catch it and bring it back to us."
    when "rake"
      "Don't take our rake, or we'll throw you in the lake"
    end
  end

  def return_date
    self.created_at + 2.days 
  end

  def return_email
    if self.status == "out" && return_date - 1.day
      return_notification
    end
  end

  def delete_record
    if self.updated_at >= 60.days
      self.destroy
    end
  end
end
