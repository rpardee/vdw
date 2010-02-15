class Dataset < ActiveRecord::Base
  has_many :dataset_variables, :order => "position"
  has_many "variables", :through => :dataset_variables, :order => "position"
  has_many :dataset_implementations
  validates_uniqueness_of :name
  validates_presence_of :name

  # TODO: Get out of the a_n_a_f stuff--go back to the original Ryan Bates complex forms approach.  It looks like there's no way to do the nice ajax add/new and delete things w/this approach.
  
  accepts_nested_attributes_for :dataset_variables, :allow_destroy => true,
    :reject_if => proc {|attrs| reject_variable(attrs)}

  def self.reject_variable(var_atts)
    # raise(var_atts.inspect)
    # {"_delete"=>"0", "var_attributes"=>{"name"=>"var?", "id"=>"", "datatype"=>"", "label"=>""}, "position"=>""}
    (var_atts["_delete"] == "1" || var_atts["var_attributes"]["name"] == "var?")
  end

end