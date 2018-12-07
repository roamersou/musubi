class CommentsController < ApplicationController
	def edit
		@comment = Comment.find(params[:id])
	end
	def update
		@comment = Comment.find(params[:id])
	    @comment.update_attributes(comment_params)
	    if @comment.save
	        flash[:success] = "恩贈りを編集しました！"
	        redirect_to("/give_mes/#{@comment.give_me_id}")
	    else
	        render :edit
	    end
	end
	def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end
  def destroy
  	@comment = Comment.find_by(id: params[:id])
    @comment.destroy
    flash[:success] = "コメントを削除しました！"
    redirect_to("/give_mes/#{@comment.give_me_id}")
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :give_me_id)
  end
end
