class User < ActiveRecord::Base
  has_many :actions

  belongs_to :application
end
