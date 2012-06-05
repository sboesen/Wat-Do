class Task < ActiveRecord::Base
	belongs_to :user
  has_one :category, foreign_key: :id, primary_key: :category_id
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
