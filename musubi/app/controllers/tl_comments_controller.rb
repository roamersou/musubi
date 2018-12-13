class TlCommentsController < ApplicationController
	def edit
		@tl_comment = TlComment.find(params[:id])
	end
	def update
		@tl_comment = TlComment.find(params[:id])
	    @tl_comment.update_attributes(tl_comment_params)
	    if @tl_comment.save
	        flash[:success] = "恩贈りを編集しました！"
	        redirect_to("/thanksletters/#{@tl_comment.thanksletter_id}")
	    else
	        render :edit
	    end
	end
	def create
    @tl_comment = TlComment.new(tl_comment_params)
    if @tl_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end
  def destroy
  	@tl_comment = TlComment.find_by(id: params[:id])
    @tl_comment.destroy
    flash[:success] = "コメントを削除しました！"
    redirect_to("/thanksletters/#{@tl_comment.thanksletter_id}")
  end

  private
  def tl_comment_params
    params.require(:tl_comment).permit(:content, :user_id, :thanksletter_id)
  end
end
