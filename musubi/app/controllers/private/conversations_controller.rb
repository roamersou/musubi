class Private::ConversationsController < ApplicationController
    def show
        @messages = Private::Message.all
    end
end
