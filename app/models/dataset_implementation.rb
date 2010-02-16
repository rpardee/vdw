class DatasetImplementation < ActiveRecord::Base
  belongs_to :site
  belongs_to :dataset
  has_many :issues, :class_name => "DatasetImplementationIssue"
  validates_presence_of :site_id, :dataset_id, :start_date, :end_date
  def self.get_update_frequencies
    %w(monthly quarterly annually)
  end
  def self.get_list
    find(:all, :select => "id, dataset_id, site_id", :include => [:dataset, :site])
  end
  def name
    "#{self.dataset.name} @ #{self.site.name}"
  end
  def open_issues
    issues.find(:all, :include => :status, :conditions => ["statuses.name in (?)", %w(Submitted Accepted Fixable)])
  end
  def caveats
    issues.find(:all, :include => :status, :conditions => ["statuses.name in (?)", 'Not fixable'])
  end
end
