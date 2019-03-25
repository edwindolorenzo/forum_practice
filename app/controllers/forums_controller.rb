class ForumsController < ApplicationController
    before_action :authenticate!, only: [:new]
    before_action :is_admin?, only: [:index]
    
    def index
        @forums = Forum.all
    end

    def new
        @forum = Forum.new
    end

    def show
        @forum = Forum.find(params[:id])
        @user = User.find(@forum.user.id)
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

    def destroy
        @forum = Forum.find(params[:id])
        @forum.destroy

        redirect_to home_path, notice: 'Forum Has been deleted'
    end

    private
    def forum_params
        params.require(:forum).permit(:title, :body).merge(user:current_user)
    end

    def is_admin?
        if current_user && current_user.admin?
            redirect_to admins_path
        end
    end
end
