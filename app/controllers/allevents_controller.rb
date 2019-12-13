class AlleventsController < ApplicationController
  def show
    @events=Event.all.sort_by{ |event| event.start_date}
  end
end
