module DataOverviewHelper
  def cell_contents(d, s)
    ret = ""
    cls = "green-cell"
    if s.datasets.include?(d) then 
      # TODO: Change title to show number of current issues and caveats.
      di = s.dataset_implementations.find_by_dataset_id(d)
      ret = link_to "Strt: #{di.start_date.to_s(:month_and_year)} <br />Upd: #{di.update_frequency}", di, {:title => "#{di.open_issues.length} open issues; #{di.caveats.length} caveats."}
      # cls = di.open_issues.length > 0 ? 'yellow-cell' : 'green-cell'
      cls = di.overview_color + '-cell'
    else
      ret = link_to "Not Impl.", {:action => "new", :controller => "dataset_implementations", :site_id => s.id, :dataset_id => d.id}, {:title => 'Click to create'}
      cls = 'red-cell'
    end
    "<td class = '#{cls}'>#{ret}</td>"
  end
end
