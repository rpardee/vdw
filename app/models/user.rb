class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :site  
  def self.get_list
    # TODO: Elaborate this model & return a limited set of interesting fields.
    find(:all, :select => "id, login", :order => "login")
  end
  def self.get_roles
    %w(Implementer Programmer/User Investigator Funder)
  end
end
