class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :price, :project_id, :timeframe, :user_id
end
