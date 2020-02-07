# frozen_string_literal: true

class SubRedditsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subreddits = SubReddit.all
  end

  def new
    @sub_reddit = SubReddit.new
  end

  def show
    @sub_reddit = SubReddit.find(params[:id])
    @post = Post.new
    @status = @sub_reddit.current_user_joined(current_user)
  end

  def edit
    @sub_reddit = SubReddit.find(params[:id])
    
  end

  def create
    @sub_reddit = SubReddit.new(sub_reddit_params)
    @sub_reddit.user = current_user
    if @sub_reddit.save
      flash[:primary] = @sub_reddit.title+' created successfuly'
      redirect_to sub_reddits_path
    else 
      render :new
    end
  end

  def join
    usr =  UserSubReddit.new(
      user: current_user,
      sub_reddit_id: params[:sub_reddit_id],
      status: UserSubReddit.statuses[:pending])
    
    if usr.save
      flash[:success] = 'Joined successfully'
      render :show
    else 
      flash[:danger] = 'There was a problem'
      render :show
    end
  end

  def leave 
    usr = UserSubReddit.where(user: current_user,sub_reddit_id: params[:sub_reddit_id]).first

    if UserSubReddit.destroy(usr.id)
      flash[:success] = 'You left this subreddit'
      redirect_to sub_reddit_path(params[:sub_reddit_id])
    else
      flash[:danger] = 'There was a problem'
      render :show
    end
  end

  private
  def sub_reddit_params
    params.require(:sub_reddit).permit(:title, :description, :background_picture)
  end
end
