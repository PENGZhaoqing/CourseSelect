class AddOpenAttribute < ActiveRecord::Migration
  def change
    add_column :courses, :open_close, :boolean, :default => false
  end
end
