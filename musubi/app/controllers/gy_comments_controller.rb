class GyCommentsController < ApplicationController
  def edit
  	@gy_comment = GyComment.find(params[:id])
  end
  def update
		@gy_comment = GyComment.find(params[:id])
	    @gy_comment.update_attributes(gy_comment_params)
	    if @gy_comment.save
	        flash[:success] = "恩贈りを編集しました！"
	        redirect_to("/payforwards/#{@gy_comment.payforward_id}")
	    else
	        render :edit
	    end
	end
	def create
    @gy_comment = GyComment.new(gy_comment_params)
    if @gy_comment.save
      NoticeMailer.send_when_gy_comment_create(@gy_comment).deliver
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end
  def destroy
  	@gy_comment = GyComment.find_by(id: params[:id])
    @gy_comment.destroy
    flash[:success] = "コメントを削除しました！"
    redirect_to("/payforwards/#{@gy_comment.payforward_id}")
  end

  private
  def gy_comment_params
    params.require(:gy_comment).permit(:content, :user_id, :payforward_id)
  end
end
