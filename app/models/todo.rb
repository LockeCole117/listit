class Todo < ActiveRecord::Base
  attr_accessible :boolean, :list_id, :name
  belongs_to :list
end
