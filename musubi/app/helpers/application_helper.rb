module ApplicationHelper
    include Private::ConversationsHelper

    def private_conversations_windows
        params[:controller] != 'messengers' ? @private_conversations_windows : []
    end
end
