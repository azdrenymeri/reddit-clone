# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @newPost = Post.new(post_params)
    @newPost.user_id = current_user.id
    @newPost.sub_reddit_id = params[:sub_reddit_id]

    if @newPost.save
      redirect_to sub_reddit_path(@newPost.sub_reddit_id)
    else
      render plain: @newPost.errors.full_messages
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
