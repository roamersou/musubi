class PayforwardsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  layout "another_layout"
  def index
    @payforwards = Payforward.all
  end

  def show
    @payforward = Payforward.find(params[:id])
    @fb_account = User.find_by(id: @payforward.user_id).fb_account
  end

  def new
    @user_id = params[:user_id]
    @user = User.find_by(id:params[:user_id])
    @payforward = current_user.payforwards.build if logged_in?
    render :layout => 'no_header'
  end

  def create
    @payforward = current_user.payforwards.build(payforward_params)
    if @payforward.save
        flash[:success] = "恩贈りを作成しました！"
        redirect_to("/users/#{params[:user_id]}")
    else
        render "new"
    end
  end

  def edit
    @payforward = Payforward.find(params[:id])
    render :layout => 'no_header'
  end

  def update
    @payforward = Payforward.find(params[:id])
    @payforward.update_attributes(payforward_params)
    if @payforward.save
        flash[:success] = "恩贈りを編集しました！"
        redirect_to @payforward
    else
        render :edit
    end
  end

  def destroy
    Payforward.find(params[:id]).destroy
    flash[:success] = "恩贈りを削除しました！"
    redirect_to("/payforwards")
  end

  private

    def payforward_params
        params.require(:payforward).permit(:title, :content, :date, :place, :picture)
    end


    def correct_user
      @payforward = current_user.payforwards.find_by(id: params[:id])
      redirect_to payforward_path if @payforward.nil?
    end
end
