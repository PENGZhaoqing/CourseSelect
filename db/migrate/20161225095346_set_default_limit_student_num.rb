class SetDefaultLimitStudentNum < ActiveRecord::Migration
  def change
    change_column_default :courses, :limit_num, from: nil, to: 0
    reversible do |dir|
      dir.up do
        # add a CHECK constraint
        execute <<-SQL
          update table courses
          set courses.limit_num = 0
          where courses.limit_num<=0 or courses.limit_num = nil
        SQL
      end
      dir.down do
        
      end
    end
  end
end
