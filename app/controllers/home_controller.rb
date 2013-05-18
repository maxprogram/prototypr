class HomeController < ApplicationController
  def index
  end

  def show
    if(!current_user.nil?)
      @user = User.find(current_user.id)
      @projects = Project.where(:user_id => current_user.id)
      #@submission 
      #@designs
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    else
      redirect_to root_url
    end
  end
end