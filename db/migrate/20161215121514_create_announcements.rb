class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.integer :user_id
      t.text :announcement_content
      t.string  :announcement_title
      t.timestamps null: false

    end
  end
end

