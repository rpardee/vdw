class CreateVariables < ActiveRecord::Migration
  def self.up
    create_table :variables do |t|
      t.string :name
      t.string :datatype
      t.integer :length
      t.string :label
      t.string :description
      t.text :details
      t.timestamps
    end
  end

  def self.down
    drop_table :variables
  end
end
