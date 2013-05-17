class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :active, :description, :end_date, :flag, :max_price, :min_price,
   :submission_id, :title, :user_id, :vote

  def initialize(user)
    self.flag = true
    self.vote = 0
    self.active = true
  end
  
end
