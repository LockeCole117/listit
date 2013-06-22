class Todo < ActiveRecord::Base
  attr_accessible :completed, :list_id, :name
  validates :name, :presence => true

  belongs_to :list



  scope :uncompleted, where(:completed => false)
  scope :completed, 	where(:completed => true)
end
