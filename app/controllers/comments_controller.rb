class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
    end
    def new
        @comment = Comment.new
    end

    def create
        post = Post.find(params[:post_id])
        @comment = Comment.new(user: current_user, post: post, content: params[:comment][:content])
        if @comment.save
          redirect_to sub_reddit_post_path(id: params[:post_id], sub_reddit_id: params[:sub_reddit_id])
        else
            # @comment.errors.full_messages.each do  |message| 
            #     flash[:alert] = message
            # end
            flash[:alert] = @comment.errors.full_messages
            redirect_to sub_reddit_post_url(id: params[:post_id], sub_reddit_id: params[:sub_reddit_id])
        end
    end

    private 
    def comment_params
        params.permit(:sub_reddit_id, :post_id,:content)
    end
end
