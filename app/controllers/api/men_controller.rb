class Api::MenController < ApplicationController
  private

  def parent
    @room ||= Room.find(params[:room_id])
  end

  def collection
    @men ||= parent.men
  end
end
