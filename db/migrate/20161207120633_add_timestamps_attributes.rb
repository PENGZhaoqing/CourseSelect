class AddTimestampsAttributes < ActiveRecord::Migration
  def change
    add_timestamps :course_infos
    add_timestamps :departments
    add_timestamps :announcements
  end
end
