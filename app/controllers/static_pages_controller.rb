class StaticPagesController < ApplicationController

    def index
        if current_user
            redirect_to sub_reddits_path
        end
    end
end
