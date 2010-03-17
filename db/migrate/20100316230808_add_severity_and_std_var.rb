class AddSeverityAndStdVar < ActiveRecord::Migration
  def self.up
    add_column :datasets, :standard_var, :string
    add_column :dataset_implementation_issues, :severity_id, :integer
  end

  def self.down
    remove_column :datasets, :standard_var
    remove_column :dataset_implementation_issues, :severity_id
  end
end
