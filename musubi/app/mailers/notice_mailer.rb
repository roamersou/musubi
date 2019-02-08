class NoticeMailer < ActionMailer::Base
  default from: ENV['USER_NAME'],
  bcc: "roamers.yano@gmail.com"
 
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
    @url = "https://vast-sierra-22205-stg.herokuapp.com/users/#{@thanksletter.receiver_id}"
    mail(to: User.find_by(id:@thanksletter.receiver_id).email, subject: "【Musubi】サンクスレターが届きました。")
  end
  def send_when_tl_comment_create(tl_comment)
    @tl_comment = tl_comment
    @comment_tl_id = Thanksletter.find_by(id:@tl_comment.thanksletter_id)
    @url = "https://vast-sierra-22205-stg.herokuapp.com/thanksletters/#{@tl_comment_id}"
    if @tl_comment.user_id == @comment_tl_id.receiver_id
      mail(to: @comment_tl_id.user.email, subject: "【Musubi】サンクスレターにコメントがつきました。")
    else
      mail(to: @tl_comment.user.email, subject: "【Musubi】あなたのコメントしたサンクスレターに新たなコメントがつきました。")
    end
  end
  # def send_when_gm_comment
  # end
  # def send_when_tl_comment
  # end
end
