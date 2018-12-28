class ThankslettersController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]
    layout "another_layout"
    def show
        @thanksletter = Thanksletter.find(params[:id])
        @fb_account = User.find_by(id: @thanksletter.user_id).fb_account
        @tl_comments = @thanksletter.tl_comments
        @tl_comment = TlComment.new
    end
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
    def edit
        @thanksletter = Thanksletter.find(params[:id])
        render :layout => 'no_header'
      end
    def update
        @thanksletter = Thanksletter.find(params[:id])
        @thanksletter.update_attributes(thanksletter_params)
        if @thanksletter.save
            flash[:success] = "恩贈りを編集しました！"
            redirect_to @thanksletter
        else
            render :edit
        end
    end
    def destroy
        @thanksletter.destroy
        flash[:success] = "サンクスレターを削除しました"
        redirect_to("/users/#{@thanksletter.receiver_id}")
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
