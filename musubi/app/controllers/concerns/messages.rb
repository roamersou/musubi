require 'active_support/concern'

module Messages
  extend ActiveSupport::Concern

  def get_messages(conversation_type, messages_amount)
    # 文字列を定数に変換するので、モデルを動的に呼び出すことができます
    model = "#{conversation_type.capitalize}::Conversation".constantize
    @conversation = model.find(params[:conversation_id])
    # 会話の前のメッセージを得る
    @messages = @conversation.messages.order(created_at: :desc)
                                      .limit(messages_amount)
                                      .offset(params[:messages_to_display_offset].to_i)
    # 変数を設定して会話の別の以前のメッセージを取得する
    @messages_to_display_offset = params[:messages_to_display_offset].to_i + messages_amount

    @type = conversation_type.downcase
    # メッセージが会話の最後にある場合は、変数に0
    # より多くのメッセージリンクを読み込むように削除されます
    if @conversation.messages.count < @messages_to_display_offset
      @messages_to_display_offset = 0
    end
  end

end