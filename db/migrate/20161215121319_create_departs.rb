class CreateDeparts < ActiveRecord::Migration
  def change
    create_table :departs do |t|
      t.string :dept_name
      t.string :dept_contact
      t.string :dept_office
      t.timestamps null: false
    end
  end
end
