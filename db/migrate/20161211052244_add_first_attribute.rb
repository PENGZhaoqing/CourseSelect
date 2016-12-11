class AddFirstAttribute < ActiveRecord::Migration
  def change
    add_column :users, :first, :boolean, default: false
  end
end
