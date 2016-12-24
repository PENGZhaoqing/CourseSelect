class AddAttributeToGrade < ActiveRecord::Migration
  def change
    #apply = 0 表示教师发布成绩，apply = 1 表示为发布成绩
    add_column :grades, :apply, :boolean, :default => false
  end
end
