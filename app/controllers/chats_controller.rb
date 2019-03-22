class ChatsController < ApplicationController

    def index
        @chats = Chat.find(params[:id])
    end
end
