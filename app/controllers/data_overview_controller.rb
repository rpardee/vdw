class DataOverviewController < ApplicationController
  def index
    @sites = Site.find(:all, :order => "standard_code")
    @datasets = Dataset.find(:all, :order => "sort_order")
  end

end