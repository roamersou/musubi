class Private::ConversationsController < ApplicationController

    def index
        @conversations = Private::Conversation.all
    end

    def show
        @messages = Private::Message.where(conversation_id: params[:id])
        @message = current_user.private_messages.build if logged_in?
        @conversation_id = params[:id]
    end
end
