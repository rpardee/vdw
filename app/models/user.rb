class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :site  
  def self.get_list
    # TODO: Elaborate this model & return a limited set of interesting fields.
    find(:all, :select => "id, login", :order => "login")
  end
  def self.get_roles
    %w(Implementer/SDM Programmer/User Investigator Funder)
  end

  def name
    if self.last_name && self.last_name.length > 0 then
      "#{first_name} #{last_name}"    
    else
      self.login
    end
  end
  def full_name
    "#{self.name}, #{self.degrees}"
  end

end
