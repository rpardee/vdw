class AddUsersToDatasetImplementationIssues < ActiveRecord::Migration
  def self.up
    add_column :dataset_implementation_issues, :submitting_user_id, :integer
    add_column :dataset_implementation_issues, :assigned_to_user_id, :integer
  end

  def self.down
    remove_column :dataset_implementation_issues, :submitting_user_id
    remove_column :dataset_implementation_issues, :assigned_to_user_id
  end
end
