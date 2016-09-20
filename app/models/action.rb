class Action < ActiveRecord::Base
  validates :user_id, presence: true
  validates :action_type, presence: true
end
