class Task < ActiveRecord::Base
	belongs_to :user
  belongs_to :category, class_name: "Category", foreign_key: :category_id
	validates :description, presence: true
	validates :user_id, presence: true

  def desc_display
    if self.description.length >= 56
      self.description[0..53] + '...'
    else
      self.description
    end
  end
end
