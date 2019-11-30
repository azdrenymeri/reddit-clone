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

  private
  def sub_reddit_params
    params.require(:sub_reddit).permit(:title, :description, :background_picture)
  end
end
