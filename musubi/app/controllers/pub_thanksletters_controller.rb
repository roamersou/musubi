class PubThankslettersController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  layout "another_layout"
  def index
  	@thanksletters = Thanksletter.all
  	@counts = Thanksletter.all.count
  end
end
