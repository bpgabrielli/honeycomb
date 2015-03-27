class ChartData
  def initialize(events)
    @events = events
  end

  def pagevisit_by_month
    @events.group_by { |e| e.created_at.month }
  end

  def pagevisits_count_per_month
    Hash[pagevisit_by_month.map {|m, p| [m, p.count] }]
  end

  def densify
    data = pagevisit_count_per_month
    (data.keys.min..data.keys.max).each do |month|
    data[month] = data[month] || 0
  end

  def sorted_densified
    densify.sort
  end

  def labeled_frequency_data
    Hash[sorted_densified.map {|m, p| [Date::MONTHNAMES[m], p] }]
  end

end
