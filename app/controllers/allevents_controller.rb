# frozen_string_literal: true

class AlleventsController < ApplicationController
  def show
    @events = Event.all.sort_by(&:start_date)
  end
end
