module Private::ConversationsHelper

    # チャットの相手となるユーザーを取得
    def private_conv_recipient(conversation)
        conversation.opposed_user(current_user)
    end

    # 会話にメッセージが表示されていない場合は、メッセージを表示するボタンを表示します
    def load_private_messages(conversation)
        if conversation.messages.count > 0
          'private/conversations/conversation/messages_list/link_to_previous_messages'
        else
          'shared/empty_partial'
        end
    end
end
