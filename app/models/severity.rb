class Severity < ActiveRecord::Base
  has_many :dataset_implementation_issues
  validates_presence_of :name, :description
end
