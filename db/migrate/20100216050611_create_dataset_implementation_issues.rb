class CreateDatasetImplementationIssues < ActiveRecord::Migration
  def self.up
    create_table :dataset_implementation_issues do |t|
      t.integer :dataset_implementation_id
      t.string :submitter
      t.string :title
      t.text :narrative
      t.integer :status_id
      t.date :status_date

      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_implementation_issues
  end
end
