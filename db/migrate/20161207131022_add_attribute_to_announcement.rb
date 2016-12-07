class AddAttributeToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :announcement_title, :string
  end
end
