class DataOverviewController < ApplicationController
  before_filter :require_user

  def index
    @implementing_sites = Site.find(:all, :order => "standard_code", :conditions => "id in (select site_id from dataset_implementations)")
    @non_implementing_sites = Site.find(:all, :order => "standard_code", :conditions => "id NOT in (select site_id from dataset_implementations)")
    @datasets = Dataset.find(:all, :order => "sort_order")
  end

end
