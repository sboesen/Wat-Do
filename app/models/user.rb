class User < ActiveRecord::Base
  has_many :tasks
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :email, on: :create, message: " can't be blank."
  validates_presence_of :password, on: :create, message: " can't be blank."
end
