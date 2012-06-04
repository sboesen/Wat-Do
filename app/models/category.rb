class Category < ActiveRecord::Base
  belongs_to :color, class_name: "Color", foreign_key: :color_id
  belongs_to :user

  validates :color_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true
end
