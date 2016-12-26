class AddDetailsToGrades < ActiveRecord::Migration
  def change
    add_column :grades, :degree, :boolean, :default => false
    add_column :grades, :rank_teacher, :integer
    add_column :grades, :rank_course, :integer
    add_column :grades, :rank_comment, :string
  end
end
