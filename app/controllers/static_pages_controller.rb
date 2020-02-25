class StaticPagesController < ApplicationController
    before_action :authenticate_user!, only: [:main]
    def index
        if current_user
            redirect_to main_page_path
        end
    end
    
    def main
        @posts = current_user.posts
        @top_communities = SubReddit.todays_top_ten
    end
end
