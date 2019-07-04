class Location < ActiveRecord::Base
  NAMES = self.all.map do |l|
    [l.name, l.id]
  end

  validates_presence_of :name
  has_many :jobs
end
