class Variable < ActiveRecord::Base
  validates_uniqueness_of :name
  def get_datatypes
    %w(text numeric date varies)
  end
end
