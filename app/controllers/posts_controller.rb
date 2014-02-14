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
  end

  def destroy
    @article.destroy
  end

  private
  def post_params
    params.permit(:title, :body)
  end
end
