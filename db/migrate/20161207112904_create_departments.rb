class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :dept_name
      t.string :dept_contact
      t.string :dept_office
    end
  end
end
