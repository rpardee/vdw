class DatasetVariable < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :variable
end
