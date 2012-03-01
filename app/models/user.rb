class User < ActiveRecord::Base
  has_many :tasks
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :email, on: :create
  validates_presence_of :password, on: :create
end
