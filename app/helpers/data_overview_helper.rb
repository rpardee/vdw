module DataOverviewHelper
  def cell_contents(d, s)
    if s.datasets.include?(d) then 
      di = s.dataset_implementations.find_by_dataset_id(d)
      link_to "Strt: #{di.start_date.to_s(:month_and_year)} <br />Upd: #{di.update_frequency}", di, {:title => 'Click for details.'}
    else
      link_to "NI", {:action => "new", :controller => "dataset_implementations", :site_id => s.id, :dataset_id => d.id}, {:title => 'Click to create'}
    end
  end
end
