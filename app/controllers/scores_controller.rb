class ScoresController < ApplicationController

  def index
    @scores=Score.search(search_params).paginate(:page => params[:page], :per_page => 20)
  end

  def export
    @scores=Score.search(search_params)
    render xlsx: "成绩表_#{DateTime.now}", template: "scores/export.xlsx.axlsx"
  end

  private
  def search_params
    params
  end

end
