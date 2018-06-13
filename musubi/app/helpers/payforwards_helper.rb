module PayforwardsHelper

    def leave_message_partial_path
        if @message_has_been_sent
          'payforwards/show/contact_user/already_in_touch'
        else
          'payforwards/show/contact_user/message_form'
        end
    end

end
