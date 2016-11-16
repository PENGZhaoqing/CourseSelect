class HomesController < ApplicationController

  def index
    @course=Course.all
    @course_play=Course.order(:student_num).limit(3)

  end

end
