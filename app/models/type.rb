class Type < ActiveRecord::Base
  NAMES = self.all.map do |t|
    [t.name, t.id]
  end
  validates_presence_of :name
  has_many :jobs
end
