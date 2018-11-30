class GiveMeController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  layout "another_layout"
  def index
    @give_mes = GiveMe.all
  end

  def show
    @give_me = GiveMe.find(params[:id])
    @fb_account = User.find_by(id: @give_me.user_id).fb_account
  end

  def new
    @user_id = params[:user_id]
    @user = User.find_by(id:params[:user_id])
    @give_me = current_user.give_mes.build if logged_in?
    render :layout => 'no_header'
  end

  def create
    @give_me = current_user.give_mes.build(give_me_params)
    if @give_me.save
        flash[:success] = "恩贈りを作成しました！"
        redirect_to("/give_me")
    else
        render "new"
    end
  end

  def edit
    @give_me = GiveMe.find(params[:id])
    render :layout => 'no_header'
  end

  def update
    @give_me = GiveMe.find(params[:id])
    @give_me.update_attributes(give_me_params)
    if @give_me.save
        flash[:success] = "恩贈りを編集しました！"
        redirect_to @give_me
    else
        render :edit
    end
  end

  def destroy
    GiveMe.find(params[:id]).destroy
    flash[:success] = "恩贈りを削除しました！"
    redirect_to("/give_me")
  end

  private

    def give_me_params
        params.require(:give_me).permit(:title, :content)
    end


    def correct_user
      @payforward = current_user.payforwards.find_by(id: params[:id])
      redirect_to payforward_path if @payforward.nil?
    end
end
