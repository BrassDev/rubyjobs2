class JobsController < ApplicationController

  def index
    @jobs = Job.recent.search_for(params[:search])

    respond_to do |format|
      format.html
      format.rss
      if params[:callback] #jsonp
     	format.js { render json: @jobs, callback: params[:callback] }
      else
	format.json { render json: @jobs }
      end
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @job = Job.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @job = find_job_with_key
    unless @job.present?
      redirect_not_found
    end
  end

  def create
    if !params[:sticky_goo_pot].blank? #houston, we have a spammer
      redirect_to :action => 'new'
    else
      @job = Job.new(secure_params)
      @types = Type.all
      @locations = Location.all

      respond_to do |format|
	if @job.save
          begin
	    JobMailer.confirmation_email(@job, request.base_url).deliver
            flash[:notice] = 'The job has been successfully listed.'
          rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e
            flash[:notice] = "Email could not be sent. Please report to the site administrator with this message: #{e.message}"
          end
	  
	  format.html { redirect_to :action => 'show', :id => @job.id, :key => @job.key }
	else
	  format.html { render :action => "new" }
	end
      end
    end
  end

  def update
    @job = find_job_with_key

    unless @job.nil?
      respond_to do |format|
	if @job.update_attributes(secure_params)
	  flash[:notice] = 'Job was successfully updated.'
	  format.html { redirect_to :action => 'show', :id => @job.id, :key => @job.key }
	else
	  format.html { render :action => "edit" }
	end
      end
    end
  end

  def destroy
    @job = find_job_with_key

    unless @job.nil?
      @job.destroy

      respond_to do |format|
	format.html { redirect_to(jobs_url) }
      end
    else
      redirect_not_found
    end
  end

  private

  def find_job_with_key
    Job.find_by_id_and_key(params[:id], params[:key])
  end

  def redirect_not_found
    flash[:notice] = "That job is no longer available"
    redirect_to(:root)
  end

  def secure_params
    params.require(:job).permit(:title, :company, :url, :email, :location_id, :type_id, :how_to_apply, :description, :remote_option)
  end

end
