class HomesController < ApplicationController

  def index
    @course=Course.all
  end

end
