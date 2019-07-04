require 'rails_helper'

RSpec.describe Job, type: :model do

  describe "before saving job" do
  
    it "should have a key" do
      job = create :job, :new_from_form
      expect(job.key).not_to eq(nil)
    end

    it "should have a unique key" do
      job1 = create :job, :new_from_form
      job2 = create :job, :new_from_form
      expect(job1.key).not_to eq(job2.key)
    end

    it "should add http on url" do
      job = create :job, :new_from_form
      job.url = "www.test.org"
      job.save!
      expect(job.url.start_with?("http://")).to be true
    end

    it "should not add http if http already there" do
      job = create :job, :new_from_form
      job.url = "http://www.test.org"
      job.save!
      expect(job.url.start_with?("http://http://")).to be false
    end

    it "should not add http if https already there" do
      job = create :job, :new_from_form
      job.url = "https://www.test.org"
      job.save!
      expect(job.url.start_with?("http://https://")).to be false
    end
  
    it "the key should not change if it already exists" do
      job = create :job, :with_key
      pre_save_key = job.key
      job.description = "Something different"
      job.save!
      expect(job.key).to eq(pre_save_key)
    end

  end # "before saving job"

  describe "validations" do
    it "should be valid with valid attributes" do
      expect(create(:job, :new_from_form)).to be_valid
    end

    fields_to_test = [:company, :email, :type_id, :location_id, :title, :description, :how_to_apply, :url]
    it "should be validate persence of #{fields_to_test.to_s}" do
      for field in fields_to_test
        job = create :job, :new_from_form
        job[field] = nil
        job.valid? # generate the error messages
        expect(job.errors.messages[field].to_s).to include "can't be blank"
      end
    end

    emails_to_test = ["test@test-dot-com", "test-at-test.com"]
    it "should be validate the email format" do
      for email_to_test in emails_to_test
        job = create :job, :new_from_form
        job.email = email_to_test
        expect(job).to_not be_valid
        #job.valid? # generate the error messages
        expect(job.errors.messages.length).to eq(1)
        expect(job.errors.messages.to_s).to include "Invalid email"
      end
    end
    
  end # "validations"

end
