class DataOverviewController < ApplicationController
  def index
    @sites = Site.find(:all)
    @datasets = Dataset.find(:all)
  end

end
