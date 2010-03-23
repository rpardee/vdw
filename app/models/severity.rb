class Severity < ActiveRecord::Base
  has_many :dataset_implementation_issues
  validates_presence_of :name, :description
  def self.yellow_rules
    # Returns an english description for how a dataset impolementation would be colored yellow on the overview/status dashboard thingy.
    ret = []
    self.find(:all, :conditions => ["yellow_limit > 0"], :order => "sort_order DESC").each do |y|
      # puts("Inspecting #{y.name}--yellow limit is #{y.yellow_limit}, red is #{y.red_limit}.")
      # how much distance between yellow and red?
      # if just one, just say the yellow_limit number--no "or more"
      # if two, list both numbers between "or"
      # if > 2, list "between #yellow_limit and #red_limit"
      s = case y.red_limit - y.yellow_limit
        when 1
          "#{y.yellow_limit}"
        when 2
          "#{y.yellow_limt} or #{y.red_limit}"
        else
          "Between #{y.yellow_limit} and #{y.red_limit}"
      end
      ret << s + " open issues of '#{y.name}' severity, OR"
    end
    ret[-1].gsub!(", OR", ".")
    ret
  end
  def self.red_rules
    ret = []
    self.find(:all, :conditions => ["red_limit > 0"], :order => "sort_order DESC").each do |r|
      ret << "#{r.red_limit} or more open issues of '#{r.name}' severity, OR"
    end
    ret[-1].gsub!(", OR", ".")
    ret
  end
end
