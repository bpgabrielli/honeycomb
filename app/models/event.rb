class Event < ActiveRecord::Base
  belongs_to :user

  def self.months
    months = Event.group_by { |e| e.created_at.month }
  end


end
