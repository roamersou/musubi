class Private::MessagesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @message = current_user.private_messages.build(message_params)
        if @message.save
            # redirect_to private_conversation_url
            # redirect_to("private/conversations/#{params[:conversation_id]}")
            redirect_to private_conversation_url(params[:conversation_id])
        else
            redirect_to private_conversations_url
        end
    end

    def destroy
    end

    private
        def message_params
            params.require(:private_message).permit(:content).merge({ conversation_id: params[:conversation_id]})
        end
end
