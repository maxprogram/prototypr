class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    if(current_user.nil?)
      redirect_to new_user_session_url, notice: 'Please Login or Signup.'
    else
      @submission = Submission.new
      @submission.project_id = params[:project_id].to_f
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @submission }
      end
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(params[:submission])
    @submission.user_id = current_user.id
    if(!@submission.nil?)
      respond_to do |format|
        if @submission.save
          format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
          format.json { render json: @submission, status: :created, location: @submission }
        else
          format.html { render action: "new" }
          format.json { render json: @submission.errors, status: :unprocessable_entity }
        end
      
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])
    
    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    @submission.active = false
    #.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end
end
