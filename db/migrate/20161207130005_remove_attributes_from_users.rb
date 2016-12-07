class RemoveAttributesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :department
    add_column :users, :department_id, :integer
  end
end
