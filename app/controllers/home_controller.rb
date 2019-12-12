class HomeController < ApplicationController
  def index
    @events=Event.all.sample(3)
  end
end
