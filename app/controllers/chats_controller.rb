class ChatsController < ApplicationController
    before_action :log_first, only: [:create]

    def index
        @chats = Chat.find(params[:id])
    end

    def new
    end

    def create
        @forum = Forum.find(params[:forum_id])
        # render plain: current_user.id.inspect
        @chat = @forum.chats.create(chat_params)
        redirect_to forum_path(@forum)
    end

    def destroy
        @forum = Forum.find(params[:forum_id])
        @chat = @forum.chats.find(params[:id])
        @chat.destroy
        redirect_to forum_path(@forum)
    end

    private
    def chat_params
        params.require(:chat).permit(:body).merge(user:current_user)
    end

    def log_first
        @forum = Forum.find(params[:forum_id])
        unless current_user
            redirect_to forum_path(@forum), notice: 'You must log in first'
        end
    end

end
