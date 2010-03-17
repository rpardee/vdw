class DatasetImplementationIssue < ActiveRecord::Base
  belongs_to :dataset_implementation
  belongs_to :status
  belongs_to :severity
  belongs_to :submitter, :class_name => "User", :foreign_key => "submitting_user_id"
  belongs_to :assigned_to, :class_name => "User", :foreign_key => "assigned_to_user_id"
  validates_presence_of :dataset_implementation_id, :title
  validates_uniqueness_of :title
end
