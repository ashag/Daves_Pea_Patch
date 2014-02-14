class PostsController < ApplicationController
  def new
    article = Post.new
  end

  def create
    @article = Post.create(post_params)
    #redirect home?
  end

  def edit

  end

  def update
  end

  def show
    @articles = Post.all
  end

  def destroy
    @article.destroy
  end

  private
  def post_params
    params.permit(:title, :body)
  end
end
