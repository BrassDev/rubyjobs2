require 'securerandom'

class Job < ActiveRecord::Base
  validates_presence_of :company, :email, :type_id, :location_id, :title, :description, :how_to_apply, :url
  validates_format_of :email, :with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, :message => "Invalid email"

  # replaced with strong parameters in Rails 4. This is now done in the controller. 
  #attr_accessible :title, :company, :url, :email, :location_id, :type_id, :how_to_apply,
  #          :description, :remote_option

  belongs_to :type
  belongs_to :location

  scoped_search on: [:company, :title, :description, :how_to_apply, :location_name, :type_name] #see http://github.com/wvanbergen/scoped_search/tree/master
  #scope :recent, lambda { { :conditions => ['created_at > ?', 8.week.ago], :order => 'created_at DESC' } }
  def self.recent
    where('created_at > ?', 8.week.ago).order('created_at DESC')
  end

  before_save :set_key, :set_http

  private

  def set_key
    self.key = SecureRandom.hex(8) if self.key.nil?
  end

  def set_http
    unless self.url.start_with?('http://') || self.url.start_with?('https://')
      self.url = 'http://' + self.url
    end
  end
end
