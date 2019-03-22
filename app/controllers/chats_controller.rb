class ChatsController < ApplicationController

    def index
        @chats = Chat.find(params[:id])
    end

    def new
    end

    def create
        @forum = Forum.find(params[:forum_id])
        # render plain: params[:chat].merge(user:current_user).inspect
        @chat = @forum.chats.create(chat_params)
        redirect_to forum_path(@forum)
    end

    private
    def chat_params
        params.require(:chat).permit(:body).merge(user:current_user)
    end

end
