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
    issues.find(:all, :include => :status, :conditions => ["statuses.consider_open = 't'"])
  end
  def caveats
    issues.find(:all, :include => :status, :conditions => ["statuses.name in (?)", 'Not fixable'])
  end
  def overview_color
    # should return green, yellow or red, based on the number and severity of open issues.

    # Test for a quick green.
    return 'green' if self.open_issues.length == 0
    # Nope--loop through the various non-green severities, counting open issues.
    Severity.find(:all, :conditions => ["red_limit > 0 or yellow_limit > 0"]).each do |sev|
      num_issues = issues.count(:all, :include => :status, :conditions => ["severity_id = ? AND statuses.consider_open = 't'", sev.id])
      # puts("Looking at #{sev.name} issues--this di has #{num_issues} of them.")
      return 'red'    if (sev.red_limit > 0 && num_issues >= sev.red_limit)
      return 'yellow' if (sev.yellow_limit > 0 && num_issues >= sev.yellow_limit)
    end
    return 'green'
  end
end
