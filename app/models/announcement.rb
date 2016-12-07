class Announcement < ActiveRecord::Base
  belongs_to :administrator, class_name: "User"

  validates :user_id, :announcement_content, :announcement_title, presence: true
end