class EventsController < ApplicationController

  def index
    @month_labels = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @events = current_user.events

    @pagevisits = @events.where(name: "page_visit")
    pagevisit_by_month = @pagevisits.group_by { |e| e.created_at.month }
    pagevisits_per_month = Hash[pagevisit_by_month.map {|m, p| [Date::MONTHNAMES[m], p.count] }]
    @pagevisit_count = @month_labels.map { |m| pagevisits_per_month[m] ? pagevisits_per_month[m] : 0 }

    @clicks = @events.where(name: "click")
    click_by_month = @clicks.group_by { |e| e.created_at.month }
    clicks_per_month = Hash[click_by_month.map {|m, c| [Date::MONTHNAMES[m], c.count] }]
    @click_count = @month_labels.map { |m| clicks_per_month[m] ? clicks_per_month[m] : 0 }
  end

end
