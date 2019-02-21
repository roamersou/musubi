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
  def send_mail_everyone(user)
    @user = user
    @url = "https://www.musubi.love/users"
    mail(bcc: User.all.map{ |user| user.email }, subject: "【Musubi】新たなメンバーが追加されました。")
  end
  def send_when_tl_create(thanksletter)
    @thanksletter = thanksletter
    @url = "https://www.musubi.love/users/#{@thanksletter.receiver_id}"
    mail(to: User.find_by(id:@thanksletter.receiver_id).email, subject: "【Musubi】サンクスレターが届きました。")
  end
  def send_when_tl_comment_create(tl_comment)
    @tl_comment = tl_comment
    @comment_tl_id = Thanksletter.find_by(id:@tl_comment.thanksletter_id)
    @url = "https://www.musubi.love/thanksletters/#{@tl_comment.thanksletter_id}"
    mail(to: @comment_tl_id.user.email, subject: "【Musubi】あなたの贈ったサンクスレターにコメントがつきました。")
  end
  def send_when_gm_create(give_me)
    @give_me = give_me
    @url = "https://www.musubi.love/give_mes"
    mail(bcc: User.all.map{ |user| user.email }, subject: "【Musubi】ギブミーが追加されました。")
  end
  def send_when_gm_comment_create(comment)
    @comment = comment
    @comment_gm_id = GiveMe.find_by(id:@comment.give_me_id)
    @url = "https://www.musubi.love/give_mes/#{@comment.give_me_id}"
    mail(to: @comment_gm_id.user.email, subject: "【Musubi】あなたの投稿したギブミーにコメントがつきました。")
  end
  def send_when_gy_create(payforward)
    @payforward = payforward
    @url = "https://www.musubi.love/payforwards"
    mail(bcc: User.all.map{ |user| user.email }, subject: "【Musubi】ギブユーが追加されました。")
  end
  def send_when_gy_comment_create(gy_comment)
    @gy_comment = gy_comment
    @comment_gy_id = Payforward.find_by(id:@gy_comment.payforward_id)
    @url = "https://www.musubi.love/payforwards/#{@gy_comment.payforward_id}"
    mail(to: @comment_gy_id.user.email, subject: "【Musubi】あなたの投稿したギブユーにコメントがつきました。")
  end
end
