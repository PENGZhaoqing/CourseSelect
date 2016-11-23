class HomesController < ApplicationController

  def index
    @course=Course.all
    @course_play_first=Course.order("student_num DESC").limit(1)
    @course_play=Course.order("student_num DESC").limit(3)-@course_play_first
    @course_play_first=@course_play_first.take
  end

end
