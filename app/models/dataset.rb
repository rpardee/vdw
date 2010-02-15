class Dataset < ActiveRecord::Base
  has_many :dataset_variables, :order => "position"
  has_many "variables", :through => :dataset_variables
  validates_uniqueness_of :name
  
  accepts_nested_attributes_for :dataset_variables, :allow_destroy => true
  # 
  # # I'm using the older 'complex-forms' style here b/c I really want to create
  # # both variables and dataset_variables here, as appropriate.
  # 
  # def xvariable_attributes
  #   self.variables
  # end
  # 
  # def xvariable_attributes=(atts)
  #   atts.each do |va|
  # 
  #     var = Variable.find_by_name(va[:name])
  # 
  #     if var.nil? then
  #       # Create a new var by this name.
  #       var = Variable.create(va)
  #       var.save!
  #       self.variables << var
  #     else
  #       # Var exists--is it already associated w/this dset?
  #     end
  # 
  # 
  #   end
  # end

end