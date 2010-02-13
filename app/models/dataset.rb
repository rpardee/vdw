class Dataset < ActiveRecord::Base
  has_many :dataset_variables
  has_many "variables", :through => :dataset_variables
  validates_uniqueness_of :name
end
