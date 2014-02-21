class EmailJob

  @queue = :email

  def self.perform(post_id)
    post = Post.find(post_id)
    users = User.where(news: true)
    email_users = users.map { |user| user.email }

    Pony.mail(to: email_users, from: "adaBugFree13@gmail.com", subject: "New Blog Post - \"#{post.title}\" ", body: "Check out our new blog post")
  end
end