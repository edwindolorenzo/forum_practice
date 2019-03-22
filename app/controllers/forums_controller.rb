class ForumsController < ApplicationController
    before_action :authenticate!, only: [:new]
    
    def index
        @forums = Forum.all
    end

    def new
        @forum = Forum.new
    end

    def show
        @forum = Forum.find(params[:id])
    end

    def create
        # render plain: params[:forum].merge(user:current_user).inspect
        @forum = Forum.new(forum_params)
        if @forum.save
            redirect_to home_path
        else
            render 'new'
        end
    end

    private
    def forum_params
        params.require(:forum).permit(:title, :body).merge(user:current_user)
    end
end
