class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :price, :project_id, :timeframe, :user_id

  validates_presence_of :description, :price, :timeframe
end
