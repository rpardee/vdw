class CreateDatasetImplementations < ActiveRecord::Migration
  def self.up
    create_table :dataset_implementations do |t|
      t.integer :site_id
      t.integer :dataset_id
      t.date :start_date
      t.date :end_date
      t.string :update_frequency
      t.text :indigenous_data
      t.text :user_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_implementations
  end
end
