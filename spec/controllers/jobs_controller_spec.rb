require 'rails_helper'

RSpec.describe JobsController, :type => :controller do
  #integrate_views

  describe "the index action" do
    before do
      @job = create :job, :new_from_form
      #get :index
      visit '/index'
    end

    it "should render correctly" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("index")
    end

    it "should render correctly as RSS" do
      get :index, format: :rss
      expect(response).to be_success
    end

    it "should render correctly as JSON" do
      get :index, format: :json
      expect(response).to be_success
    end

    it "should respond correctly to JSONP" do
      get :index, callback: 'someCallback', format: :js
      expect(response).to be_success
      jsonp = response.body
      expect(jsonp[0..12]).to eq('someCallback(')
    end
    
    it "should assign a jobs collection" do
      expect(assigns[:jobs]).to_not be_nil
    end

    it "the newly created job should be first in the jobs collection" do
      expect(assigns[:jobs][0]).to eq(@job)
    end
    
    #describe "when there are jobs to display" do
    #  it "should list the most recent jobs" do
    #    byebug
    #    #expect(response.body).to have_selector("ul#job_list")
    #    expect(response.body).to have_css("ul")
    #  end
    #end

    
  end


end
