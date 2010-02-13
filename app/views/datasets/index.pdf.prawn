@datasets.each do |d|
  pdf.text d.name
  pdf.text d.description
end