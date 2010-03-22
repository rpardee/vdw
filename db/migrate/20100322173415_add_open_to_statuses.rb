class AddOpenToStatuses < ActiveRecord::Migration
  def self.up
    add_column :statuses, :consider_open, :boolean
  end

  def self.down
    remove_column :statuses, :consider_open, :boolean
  end
end
