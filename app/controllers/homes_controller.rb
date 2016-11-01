class HomesController < ApplicationController

  def index
    @course=Course.all
    @course1=Course.find_by_id(1)
  end

end
