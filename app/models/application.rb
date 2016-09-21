class Application < ActiveRecord::Base
  has_many :actions # not sure if this'll be useful, but it's true
  has_many :rewards
  has_many :rules
  has_many :users

  validates :key, presence: true
end
