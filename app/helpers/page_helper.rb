module PageHelper

  def calendar( month, year )
    current_date = Date.new(year,month)

    prev_month = month - 1
    prev_year = year
    if( prev_month <= 0 )
      prev_month = 12
      prev_year = year - 1
    end

    next_month = month + 1
    next_year = year
    if( next_month >= 13 )
      next_month = 1
      next_year = year + 1
    end
    cal = "" #"/calendar/#{prev_year}/#{prev_month}"
    cal += link_to "Prev", calendar_path(:month=>prev_month, :year=>prev_year)
    cal += link_to "Next", calendar_path(:month=>next_month, :year=>next_year)
    cal += current_date.strftime("%B")
    day_of_week = current_date.strftime("%w").to_i
    cal += "<table border='1'>\n\t<tr>\n"
    days = %w(Sun Mon Tue Wed Thu Fri Sat)
    days.each do | day |
      cal += "\t\t<td>#{day}</td>\n"
    end

    #second row - first week of the month
    cal += "<tr>"
    day_of_week.times do
      cal += "<td>&nbsp;</td>"
    end

    #print the days of week starting with 1
    (7 - day_of_week).times do |day|
      cal += "<td>#{day + 1}</td>"
    end

    cal += "</tr>"

    cal += "</tr>\n</table>\n"
    cal += "Month: #{month}<br />Year: #{year}<br />"
    cal += day_of_week.to_s
    return cal
  end
end