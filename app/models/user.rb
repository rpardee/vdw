class User < ActiveRecord::Base
  acts_as_authentic
  
  def self.get_list
    # TODO: Elaborate this model & return a limited set of interesting fields.
    find(:all, :select => "id, login", :order => "login")
  end
end
