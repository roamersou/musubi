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
    # mail(to: , subject: "【Musubi】新たなメンバーが追加されました。")
  end
  
  def send_when_tl_create(thanksletter)
    @thanksletter = thanksletter
    @url = "https://vast-sierra-22205-stg.herokuapp.com/users/#{@thanksletter.receiver_id}"
    mail(to: User.find_by(id:@thanksletter.receiver_id).email, subject: "【Musubi】サンクスレターが届きました。")
  end
  def send_when_tl_comment_create(tl_comment)
    @tl_comment = tl_comment
    @comment_tl_id = Thanksletter.find_by(id:@tl_comment.thanksletter_id)
    @url = "https://vast-sierra-22205-stg.herokuapp.com/thanksletters/#{@tl_comment.thanksletter_id}"
    # if @tl_comment.user_id == @comment_tl_id.receiver_id
    mail(to: @comment_tl_id.user.email, subject: "【Musubi】サンクスレターにコメントがつきました。")
    # else
    #   mail(to: @tl_comment.user.email, subject: "【Musubi】あなたのコメントしたサンクスレターに新たなコメントがつきました。")
    end
  end
  def send_when_gm_create(give_me)
    @give_me = give_me
    @url = "https://vast-sierra-22205-stg.herokuapp.com/give_mes"
    mail(bcc: User.all.map{ |user| user.email }, subject: "【Musubi】ギブミーが追加されました。")
  end
  def send_when_gm_comment_create(comment)
    @comment = comment
    @comment_gm_id = GiveMe.find_by(id:@comment.give_me_id)
    @url = "https://vast-sierra-22205-stg.herokuapp.com/give_mes/#{@comment.give_me_id}"
    # if @comment.user_id == @comment_gm_id.user_id
    mail(to: @comment_gm_id.user.email, subject: "【Musubi】あなたの投稿したギブミーにコメントがつきました。")
    # else
    #   mail(to: @tl_comment.user.email, subject: "【Musubi】あなたのコメントしたサンクスレターに新たなコメントがつきました。")
    end
  end
  def send_when_gy_create(payforward)
    @payforward = payforward
    @url = "https://vast-sierra-22205-stg.herokuapp.com/payforwards"
    mail(bcc: User.all.map{ |user| user.email }, subject: "【Musubi】ギブユーが追加されました。")
  end
  # def send_when_gy_comment
  # end
end
