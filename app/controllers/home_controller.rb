# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @client_ip = remote_ip
    @array = []
    @events = Event.all.sort_by(&:start_date).values_at(0, 1, 2)
  end
end
