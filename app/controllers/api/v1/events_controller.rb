class Api::V1::EventsController < Api::V1::ApplicationController
  require 'uri'

  def create
    @event = Event.new(params.require(:event).permit(:name, :property_1, :property_2, :url))
    @user = User.find_by(unique_key: params[:unique_key])
    @event.user = @user
    @website = URI.parse(@event.url).host
    @event.website = @website

    if @event.save
      render json: @event
    else
      render json: {error: "didn't save"}, status: 500
    end
  end

end