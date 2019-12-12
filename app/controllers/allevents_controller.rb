class AlleventsController < ApplicationController
  def index
    @events=Event.all.sort_by{ |event| event.start_date}
  end
end
