class User < ActiveRecord::Base
  has_many :actions
  has_many :aliases

  belongs_to :application
end
