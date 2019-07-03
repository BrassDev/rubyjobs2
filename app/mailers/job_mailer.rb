class JobMailer < ActionMailer::Base
  default from: "jobs@rubyjobs.ie"
  
  def confirmation_email(job, base_url)
    @job = job
    @base_url = base_url 

    mail(:to => job.email, :subject => "[RubyJobs.ie] Your job is now live (##{job.id})")
  end
end
