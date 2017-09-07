class AddCourseAttribute < ActiveRecord::Migration
  def change
    add_column :courses, :open, :boolean, default: false
  end
end
