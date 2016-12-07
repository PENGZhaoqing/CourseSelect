class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :class, :string
    add_column :users, :reset, :boolean #密码重置位
  end
end