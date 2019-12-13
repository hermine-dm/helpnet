# frozen_string_literal: true

class StaticController < ApplicationController
  def show
    render template: "static/#{params[:page]}"
  end

  def event_all; end
end
