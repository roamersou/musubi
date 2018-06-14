class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :opened_conversations_windows
  include SessionsHelper

  private

  #  ユーザーのログインを確認する
    def logged_in_user
      unless logged_in?
        # store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end

    def opened_conversations_windows
      if logged_in?
        # 開かれた会話
        session[:private_conversations] ||= []
        @private_conversations_windows = Private::Conversation.includes(:recipient, :messages)
                                          .find(session[:private_conversations])
      else
        @private_conversations_windows = []
      end
    end
end
