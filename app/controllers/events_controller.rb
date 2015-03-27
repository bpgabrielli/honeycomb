class EventsController < ApplicationController

  def index
    @events = current_user.events
    @pagevisit_chart_data = ChartData.new(@events.where(name: "page_visit"))
    @click_chart_data = ChartData.new(@events.where(name: "click"))
  end

end
