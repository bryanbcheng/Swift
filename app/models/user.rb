class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :password, :presence => true

  has_many :beats
end
