class StaticPagesController < ApplicationController
    before_action :authenticate_user!, only: [:main]
    def index
        if current_user
            redirect_to root_path
        end
    end
    def main
    end
end
