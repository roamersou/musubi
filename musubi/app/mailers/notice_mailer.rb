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
    mail(to: @user.email, to: "roamers.yano@gmail.com", subject: "会員登録が完了しました。")
  end
end
