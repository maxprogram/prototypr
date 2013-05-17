class User < ActiveRecord::Base
  after_initialize :create_default_data
  has_many :projects
  has_many :submissions
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :active, :bio, :first, :flag, :last, :profile, :reputation, :web

  validates_presence_of :email, :password, :password_confirmation, :bio, :first, :last

  
  protected

    def create_default_data
      self.active = true
  	  self.flag = false
  	  self.reputation = 0
  	  self.admin = false
    end
  
end
