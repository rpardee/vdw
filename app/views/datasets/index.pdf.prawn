ds = @datasets.map{|s| [s.name, s.description]}
pdf.table ds, 
  :position => :center,
  :headers => %w(Name Description),
  :row_colors => %w(B1BFCD E8F2FF),
  :vertical_padding => 5,
  :horizontal_padding =>3

