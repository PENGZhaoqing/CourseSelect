class ModifyCourseAttributes < ActiveRecord::Migration
  def change
    add_column :courses, :department, :integer
    add_column :courses, :academic_year, :string
    add_column :courses, :semester, :string
    add_column :courses, :description, :text
    add_column :courses, :apply, :string  #0正常课程 1增课申请 2修改课程申请 3删除课程申请
    remove_column :courses, :open, :boolean
  end
end
