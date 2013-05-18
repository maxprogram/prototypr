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
  attr_accessible :active, :bio, :first, :flag, :last, :profile, :reputation, :web, :profileimg
  
  validates_presence_of :email, :password, :password_confirmation, :bio, :first, :last


  #paperclip-profile img
  has_attached_file :profileimg, styles: {thumb: '100x100>',medium: '300x300>'},
                    :url  => "/assets/images/user/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/images/user/:id/:style/:basename.:extension"
  validates_attachment_size :profileimg, :less_than => 5.megabytes
  validates_attachment_content_type :profileimg, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
  
  protected

    def create_default_data
      self.active = true
  	  self.flag = false
  	  self.reputation = 0
  	  self.admin = false
    end
  
end
