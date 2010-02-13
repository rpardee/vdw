class CreateDatasetVariables < ActiveRecord::Migration
  def self.up
    create_table :dataset_variables do |t|
      t.integer :dataset_id
      t.integer :variable_id
      t.integer :position
      t.string :notes
      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_variables
  end
end
