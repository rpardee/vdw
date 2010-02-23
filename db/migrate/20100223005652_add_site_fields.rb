class AddSiteFields < ActiveRecord::Migration
  def self.up
    add_column :sites, :vdw_site, :boolean, :default => false
  end

  def self.down
    remove_column :sites, :vdw_site
  end
end
