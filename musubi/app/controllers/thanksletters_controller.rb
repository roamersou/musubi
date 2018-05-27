class ThankslettersController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :destroy]
    before_action :correct_user, only: :destroy

    def new
        @user_id = params[:user_id]
        @user = User.find_by(id:params[:user_id])
        @thanksletter = current_user.thanksletters.build if logged_in?
    end

    def create
        @thanksletter = current_user.thanksletters.build(thanksletter_params.merge(receiver_id: params[:user_id]))
        if @thanksletter.save
            flash[:success] = "サンクスレターを作成しました！"
            redirect_to("/users/#{params[:user_id]}") 
        else
            render "new"
        end
    end

    def destroy
        @thanksletter.destroy
        flash[:success] = "サンクスレターを削除しました"
        redirect_to user_url
    end

    private

    def thanksletter_params
        params.require(:thanksletter).permit(:content)
    end

    def correct_user
        @thanksletter = current_user.thanksletters.find_by(id: params[:id])
        redirect_to user_url if @thanksletter.nil?
    end
end
