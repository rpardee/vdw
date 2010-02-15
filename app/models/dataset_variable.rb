class DatasetVariable < ActiveRecord::Base
  belongs_to :variable
  belongs_to :dataset
  validates_presence_of :dataset_id
  validates_presence_of :variable_id
  # This doesn't work--causes an error in datasets/1/edit.
  # accepts_nested_attributes_for :variable, :allow_destroy => true
  def var_attributes=(atts)
    # raise("boobies!")
    # raise(atts[:name])
    var = Variable.find_by_name(atts[:name]) 
    if var.nil? then
      logger.info("Could not find a variable called #{atts[:name]}--creating a new one.")
      var = Variable.new(atts)
      var.save
      logger.info("Variable created & saved: #{var.inspect}")
    else
      logger.info("Found var #{var.name} (id = #{var.id}).")
    end
    self.variable = var
  end
end
