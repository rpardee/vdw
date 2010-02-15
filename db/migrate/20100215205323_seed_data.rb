class SeedData < ActiveRecord::Migration
    @@sites = {"GHC" => ["Group Health Cooperative", "Seattle", "WA", "01"],
"KPNW" => ["Kaiser Permanente Northwest", "Portland", "OR", "02"],
"KPNC" => ["Kaiser Permanente Northern California", "Oakland", "CA", "03"],
"KPSC" => ["Kaiser Permanente Southern California", "Pasadena", "CA", "04"],
"KPHI" => ["Kaiser Permanente Hawaii", "Honolulu", "HI", "05"],
"KPCO" => ["Kaiser Permanente Colorado", "Denver", "CO", "06"],
"HPRF" => ["HealthPartners", "Minneapolis", "MN", "07"],
"HPHC" => ["Harvard Pilgrim Health Care", "Boston", "MA", "08"],
"MPCI" => ["Fallon Community Health Plan", "Worchester", "MA", "09"],
"HFHS" => ["Henry Ford Health Systems", "Detroit", "MI", "10"],
"KPGA" => ["Kaiser Permanente Georgia", "Atlanta", "GA", "11"],
"LHS"  => ["Lovelace Health Systems", "Albequerque", "NM", "12"],
"MCRF" => ["Marshfield Clinic", "Marshfield", "WI", "13"],
"GHS"  => ["Geisinger", "Danville", "PA", "14"],
"SWH"  => ["Scott & White Memorial Hospital", "Temple", "TX", "15"],
"MHS"  => ["Maccabi Healthcare Services", "Tel Aviv", "", "16"]}

    @@dsets  = {"Demographics" => ["Basic, static information on the people whose data are in the VDW", 1],
          "Enrollment"         => ["People/Periods during which the site has responsibility for either *providing* or at least *paying for* medical care", 2],
          "Utilization"        => ["Encounters between patients/enrollees and the providers of the organization", 3],
          "Diagnosis"          => ["Diagnoses associated with the encounters in Utilization", 4],
          "Procedures"         => ["Procedures associated with the encounters in Utilization", 5],
          "Tumor"              => ["A registry of primary Tumors diagnosed in people at the organization.", 6],
          "Rx"                 => ["Outpatient prescriptions filled at the organization.", 7],
          "Census"             => ["Census Bureau reported demographics attached to the people in Enrollment", 8],
          "Provider Specialty" => ["Basic static information on the providers found in the Utilization datasets.", 9],
          "Vital Signs"        => ["Measures of height/weight/blood pressure taken at EMR-captured encounters", 10],
          "Lab Results"        => ["Results of lab tests resulted at the organization.", 11],
          "Death"              => ["Information about the deaths of the people at the organization.", 12]
  }

  def self.up

    add_column :datasets, :sort_order, :integer, :default => 0
    
    @@dsets.each do |name, dat|
      if Dataset.find_by_name(name).nil? then
        d = Dataset.new
        d.name = name
        d.description = dat[0]
        d.sort_order = dat[1]
        d.version = "2"
        begin
          d.save!
        rescue Exception => e
          puts("Barfed on dset #{name}")
          raise
        end
        
      end
    end
    @@sites.each do |abbrev, dat|
      if Site.find_by_abbreviation(abbrev).nil? then
        puts(dat.inspect)
        s = Site.new
        s.abbreviation = abbrev
        s.name = dat[0]
        s.city = dat[1]
        s.state = dat[2]
        s.standard_code = dat[3]
        begin
          s.save!
        rescue Exception => e
          puts("Barfed on #{dat.inspect}")
          raise
        end
      end
    end
  end

  def self.down
    remove_column :datasets, :sort_order
    @@sites.each do |abbrev, dat|
      s = Site.find_by_abbreviation(abbrev)
      s.dataset_implementations.each {|di| di.delete}
      Site.delete(s)
    end
    @@dsets.each do |name, dat|
      Dataset.find_by_name(name).delete
    end
  end
end
