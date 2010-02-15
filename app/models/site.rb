class Site < ActiveRecord::Base
  validates_presence_of :name, :abbreviation, :standard_code
  validates_uniqueness_of :name, :abbreviation, :standard_code
  has_many :dataset_implementations
  has_many "datasets", :through => :dataset_implementations
  def location
    "#{self.city}, #{self.state}"
  end
end
