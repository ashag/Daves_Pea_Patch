class Post < ActiveRecord::Base
  belongs_to :user

  def news_email
    users = User.where(news: true)
    email_users = users.map { |user| user.email }

    Pony.mail(to: email_users, from: "adaBugFree13@gmail.com", subject: "New Blog Post - #{self.title}", body: "Check out our new blog post")

end
