class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :admin_access, only: :new
  layout "another_layout"
  def index
    @users = User.paginate(page:params[:page])
  end

  def show
    @user = User.find(params[:id])
    @receiver_id = Thanksletter.where(receiver_id: @user.id)
    @thanksletters = @receiver_id.paginate(page: params[:page])
    @payforwards = @user.payforwards.paginate(page: params[:page])
    @give_mes = @user.give_mes.paginate(page: params[:page])
  end

  def new
    @user = User.new
    render :layout => 'no_header'
  end

  def create
    @random_password =  SecureRandom.urlsafe_base64
    password = { password: @random_password, password_confirmation: @random_password}
    @user = User.new(user_params.merge(password))
    if @user.save
      log_in @user
      flash[:success] = "ユーザー登録が完了しました！"
      NoticeMailer.send_mail(@user).deliver
      NoticeMailer.send_mail_everyone(@user).deliver
      redirect_to("/users/#{@user.id}")
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
    render :layout => 'no_header'
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      redirect_to @user, notice: "ユーザー情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :self_intro, :fb_account, :tw_account, :insta_account, :picture)
  end

  #beforeフィルター

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(@user) unless current_user?(@user)
  end

  # 管理者かどうか確認
  def admin_user
    redirect_to(@user) unless current_user.admin?
  end

  def admin_access
    redirect_to root_url unless current_user.admin?
  end
end
