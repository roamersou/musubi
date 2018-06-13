class Private::ConversationsController < ApplicationController
    def create
        recipient_id = Payforward.find(params[:payforward_id]).user.id
        conversation = Private::Conversation.new(sender_id: current_user.id,
                                                 recipient_id: recipient_id)
        if conversation.save
            Private::Message.create(user_id: recipient_id, 
                                    conversation_id: conversation.id, 
                                    content: params[:message_content])
            respond_to do |format|
              format.js {render partial: 'payforwards/show/contact_user/message_form/success'}
            end
        else
            respond_to do |format|
              format.js {render partial: 'payforwards/show/contact_user/message_form/fail'}
            end
        end
    end
end
