# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # FIXME: Is there a convention for where these things should go?
  Date::DATE_FORMATS[:month_and_year] = "%b %Y"  
  def severity_link(sev)
    if sev then
      link_to sev.name, sev, :title => sev.description
    end
  end
  def status_link(stat)
    if stat then
      link_to stat.name, stat, :title => stat.description
    end
  end
  def user_link(us)
    if us then
      
      link_to us.name, us, :title => (us.site ? "from #{us.site.name}" : "")
    end
  end
end
