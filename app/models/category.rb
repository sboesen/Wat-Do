class Category < ActiveRecord::Base
  has_one :color, foreign_key: :id, primary_key: :color_id
  belongs_to :user

  validates :color_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true
end
