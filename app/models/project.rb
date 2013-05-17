class Project < ActiveRecord::Base
  after_initialize :create_default_data
  belongs_to :user
  has_many :submissions
  attr_accessible :active, :description, :end_date, :flag, :max_price, :min_price,
   :submission_id, :title, :user_id, :vote
 
  validates_presence_of :description, :end_date, :max_price, :min_price, :title


  protected

    def create_default_data
      self.flag = true
      self.vote = 0
      self.active = true
    end
end
