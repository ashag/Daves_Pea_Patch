class PostsController < ApplicationController
  def new
    @article = Post.new
  end

  def create
    @article = Post.create(post_params)
    render :'posts/show'
  end

  def edit

  end

  def update
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @article.destroy
  end

  def subscribe
    user = User.find(params[:user_id])
    user.update(news: true)

    redirect_to posts_show_path
  end

  private
  def post_params
    params.permit(:title, :body)
  end
end
