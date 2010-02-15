# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # FIXME: Is there a convention for where these things should go?
  Date::DATE_FORMATS[:month_and_year] = "%b %Y"  
end
