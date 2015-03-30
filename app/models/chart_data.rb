class ChartData
  def initialize(events)
    @events = events
  end

  def pagevisit_by_month
    @events.group_by { |e| e.created_at.month }
  end

  def pagevisits_count_per_month
    pagevisit_by_month.transform_values { |p| p.count }
  end

  def densify
    data = pagevisits_count_per_month
    (data.keys.min..data.keys.max).each do |month|
      data[month] = data[month] || 0
    end
  end

  def sorted_densified
    densify.sort
  end

  def labeled_frequency_data
    sorted_densified.transform_keys { |m| Date::MONTHNAMES[m] }
  end

end
