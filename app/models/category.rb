class Category < ActiveRecord::Base
  belongs_to :color, class_name: "Color", foreign_key: :color_id
  belongs_to :user
end
