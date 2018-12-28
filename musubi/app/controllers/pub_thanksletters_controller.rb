class PubThankslettersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  layout "another_layout"
  def index
  	@thanksletters = Thanksletter.all
  	@counts = Thanksletter.all.count
  end
  def show
  	@thanksletter = Thanksletter.find(params[:id])
  	@tl_comments = @thanksletter.tl_comments
    @tl_comment = TlComment.new
  end
end
