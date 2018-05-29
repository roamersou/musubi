class PayForwardsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
    before_action :correct_user, only: :destroy

    def index
        @pay_forwards = PayForward.paginate(page:params[:page])
    end

    def show
        @pay_forward = PayForward.find(params[:id])
    end

    def new
        @user_id = params[:user_id]
        @user = User.find_by(id:params[:user_id])
        @pay_forward = current_user.pay_forwards.build if logged_in?
    end

    def create
        @pay_forward = current_user.pay_forwards.build(pay_forward_params.merge(user_id: params[:user_id]))
        if @pay_forward.save
            flash[:success] = "恩贈りを作成しました！"
            redirect_to("/users/#{params[:user_id]}")
        else
          render :new
        end
    end

    def edit
        @pay_forward = PayForward.find_by(params[:user_id])
    end

    def update
        @pay_forward = PayForward.find_by(params[:user_id])
        @pay_forward.update_attributes(pay_forward_params)
        if @pay_forward.save
          redirect_to @pay_forward, notice: '恩贈りを編集しました'
        else
          render :edit
        end
    end

    def destroy
        @pay_forward = PayForward.find_by(params[:id])
        @pay_forward.destroy
        flash[:success] = "恩贈りを削除しました"
        redirect_to pay_forwards_url
    end

    private

    def pay_forward_params
        params.require(:pay_forward).permit(:title, :content, :date, :place, :picture)
    end

    def correct_user
        @pay_forward = current_user.pay_forwards.find_by(id: params[:id])
        redirect_to user_url if @pay_forward.nil?
    end
end
