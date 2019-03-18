class ForumsController < ApplicationController
    def index
        @forums = Forum.all
    end

    def new
        @forum = Forum.new
    end

    def create
        # render plain: params[:forum].inspect
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
