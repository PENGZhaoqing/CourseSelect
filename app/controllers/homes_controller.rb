class HomesController < ApplicationController

  def index
    @scores=Score.paginate(:page => params[:page], :per_page => 10)
  end

end
