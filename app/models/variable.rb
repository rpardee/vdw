class Variable < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :datatype
  has_many :dataset_variables
  has_many "datasets", :through => :dataset_variables
  def self.get_datatypes
    %w(text numeric date varies)
  end
end
