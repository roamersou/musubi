class NoticeMailer < ActionMailer::Base
  default from: ENV['USER_NAME']
 
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def send_mail(user)
    @user = user
    @url = "https://www.musubi.love/login"
    mail(to: @user.email, subject: "【Musubi】会員登録が完了しました。")
  end
  
  def send_when_tl_create(thanksletter)
    @thanksletter = thanksletter
    @url = "https://www.musubi.love/users/#{@thanksletter.receiver_id}"
    mail(to: User.find_by(id:@thanksletter.receiver_id).email, subject: "【Musubi】サンクスレターが届きました。")
  end
  # def send_when_gy_comment
  # end
  # def send_when_gm_comment
  # end
  # def send_when_tl_comment
  # end
end
