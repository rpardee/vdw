class DatasetImplementation < ActiveRecord::Base
  belongs_to :site
  belongs_to :dataset
  validates_presence_of :site_id, :dataset_id, :start_date, :end_date
end
