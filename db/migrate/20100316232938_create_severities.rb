=begin
minor       = Annoyance-level.  Data largely usable/interpretable as intended, but requires custom manipulation/interpretation.
significant = ability to serve an important within-scope research use is significantly degraded.
serious     = ability to serve two or more important within-scope research uses is significantly or completely degraded.
critical    = a flaw going to the essense of the file--dataset may as well not be implemented at all
=end
class CreateSeverities < ActiveRecord::Migration
  def self.up
    create_table :severities do |t|
      t.string :name
      t.string :description
      t.integer :sort_order
      t.integer :red_limit
      t.integer :yellow_limit

      t.timestamps
    end
    sort_order = 10
    ({"minor" => "Annoyance-level.  Data largely usable/interpretable as intended, but requires custom manipulation/interpretation.",
"significant" => "ability to serve an important within-scope research use is significantly degraded.",
"serious"     => "ability to serve two or more important within-scope research uses is significantly or completely degraded.",
"critical"    => "a flaw going to the essense of the file--dataset may as well not be implemented at all",
}).each do |key, val|
      Severity.create(:name => key, :description => val, :sort_order => sort_order)
      sort_order += 10
    end
  end

  def self.down
    drop_table :severities
  end
end
