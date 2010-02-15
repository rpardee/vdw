class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :name, :null => false
      t.string :city
      t.string :state
      t.string :abbreviation, :null => false
      t.string :standard_code, :null => false
      t.text :description
      t.string :sas_version

      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
